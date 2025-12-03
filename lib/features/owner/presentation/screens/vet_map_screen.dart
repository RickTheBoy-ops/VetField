import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/services/directions_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/vet_entity.dart';
import '../providers/vet_provider.dart';

import 'package:go_router/go_router.dart';

class VetMapScreen extends ConsumerStatefulWidget {
  const VetMapScreen({super.key});

  @override
  ConsumerState<VetMapScreen> createState() => _VetMapScreenState();
}

class _VetMapScreenState extends ConsumerState<VetMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  // Posição padrão (São Paulo) caso não consiga localização
  static const CameraPosition _kDefaultLocation = CameraPosition(
    target: LatLng(-23.550520, -46.633308),
    zoom: 14.4746,
  );

  Position? _currentPosition;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  bool _isLoadingLocation = true;
  double _radiusKm = 10.0;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    await _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      _getCurrentLocation();
    } else {
      setState(() => _isLoadingLocation = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permissão de localização necessária')),
        );
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
        _isLoadingLocation = false;
      });

      // Buscar vets próximos
      ref
          .read(nearbyVetsControllerProvider.notifier)
          .fetchNearbyVets(
            lat: position.latitude,
            lng: position.longitude,
            radius: _radiusKm,
          );

      // Mover câmera
      final controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 14,
          ),
        ),
      );
    } catch (e) {
      setState(() => _isLoadingLocation = false);
      debugPrint('Erro ao obter localização: $e');
    }
  }

  void _onRadiusChanged(double value) {
    setState(() {
      _radiusKm = value;
    });
    if (_currentPosition == null) return;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      final pos = _currentPosition!;
      ref
          .read(nearbyVetsControllerProvider.notifier)
          .fetchNearbyVets(
            lat: pos.latitude,
            lng: pos.longitude,
            radius: _radiusKm,
          );
    });
  }

  void _updateMarkers(List<VetEntity> vets) {
    final markers = vets.map((vet) {
      return Marker(
        markerId: MarkerId(vet.id),
        position: LatLng(vet.latitude, vet.longitude),
        infoWindow: InfoWindow(
          title: vet.name,
          snippet: 'R\$ ${vet.price} - Toque para agendar',
          onTap: () {
            context.push(
              '/book/${vet.id}',
              extra: {'vetName': vet.name, 'price': vet.price},
            );
          },
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      );
    }).toSet();

    // Adicionar marcador do usuário
    if (_currentPosition != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('me'),
          position: LatLng(
            _currentPosition!.latitude,
            _currentPosition!.longitude,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
          infoWindow: const InfoWindow(title: 'Você está aqui'),
        ),
      );
    }

    setState(() {
      _markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ouvir mudanças na lista de vets
    ref.listen(nearbyVetsControllerProvider, (previous, next) {
      next.whenData((vets) => _updateMarkers(vets));
    });

    ref.listen(sosNearestVetControllerProvider, (prev, next) {
      next.when(
        data: (vet) async {
          if (vet != null) {
            final controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newLatLngZoom(
                LatLng(vet.latitude, vet.longitude),
                15,
              ),
            );
            if (!mounted) return;
            if (context.mounted) {
              context.push(
                '/book/${vet.id}',
                extra: {'vetName': vet.name, 'price': vet.price},
              );
            }
          } else {
            if (mounted && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nenhum vet disponível próximo')),
              );
            }
          }
        },
        error: (err, stack) {
          if (mounted && context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Erro SOS: $err')));
          }
        },
        loading: () {},
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kDefaultLocation,
            markers: _markers,
            polylines: _polylines,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),

          // Header / Search Bar placeholder
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.textSecondary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Buscar veterinários...',
                      style: TextStyle(
                        color: AppColors.textSecondary.withValues(alpha: 0.7),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.tune, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),

          // Radius Slider
          Positioned(
            bottom: 270,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Raio da busca',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('${_radiusKm.toStringAsFixed(0)} km'),
                    ],
                  ),
                  Slider(
                    value: _radiusKm,
                    min: 1,
                    max: 50,
                    divisions: 49,
                    label: '${_radiusKm.toStringAsFixed(0)} km',
                    activeColor: AppColors.primary,
                    onChanged: _onRadiusChanged,
                  ),
                ],
              ),
            ),
          ),

          // Loading Indicator
          if (_isLoadingLocation)
            const Center(child: CircularProgressIndicator()),

          // Bottom Sheet Placeholder (List View)
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Alternar para lista
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cardBackground,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 8),
                  Text('Ver Lista'),
                ],
              ),
            ),
          ),

          // My Location Button
          Positioned(
            bottom: 80,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _getCurrentLocation,
              child: const Icon(
                Icons.my_location,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          Positioned(
            bottom: 150,
            right: 20,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.red,
              icon: const Icon(Icons.emergency, color: Colors.white),
              label: const Text('SOS', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                if (_currentPosition == null) {
                  await _getCurrentLocation();
                }
                final pos = _currentPosition;
                if (pos == null) return;
                ref
                    .read(sosNearestVetControllerProvider.notifier)
                    .fetch(lat: pos.latitude, lng: pos.longitude);
              },
            ),
          ),

          Positioned(
            bottom: 210,
            right: 20,
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.local_taxi, color: Colors.white),
              label: const Text(
                'VetRide',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_markers.isEmpty) return;
                final m = _markers.first;
                final lat = m.position.latitude;
                final lng = m.position.longitude;
                final uri = Uri.parse(
                  'https://m.uber.com/ul/?action=setPickup&pickup=my_location&dropoff[latitude]=$lat&dropoff[longitude]=$lng',
                );
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
          ),

          Positioned(
            bottom: 260,
            right: 20,
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.secondary,
              icon: const Icon(Icons.alt_route, color: Colors.white),
              label: const Text('Rotas', style: TextStyle(color: Colors.white)),
              onPressed: _planOptimizedRoute,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _planOptimizedRoute() async {
    if (_currentPosition == null || _markers.length <= 2) return;
    final origin = LatLng(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
    );
    final waypoints = _markers
        .where((m) => m.markerId.value != 'me')
        .map((m) => m.position)
        .toList();
    if (waypoints.isEmpty) return;

    try {
      final ordered = _nearestNeighborOrder(origin, waypoints);
      final improved = _twoOptImprove([origin, ...ordered]);
      final service = DirectionsService();
      final polyline = await service.getOptimizedRoute(
        origin: improved.first,
        destination: improved.last,
        waypoints: improved.sublist(1, improved.length - 1),
      );
      setState(() {
        _polylines = {
          Polyline(
            polylineId: const PolylineId('route'),
            points: polyline,
            color: AppColors.secondary,
            width: 5,
          ),
        };
      });
    } catch (_) {
      final ordered = _nearestNeighborOrder(origin, waypoints);
      final improved = _twoOptImprove([origin, ...ordered]);
      setState(() {
        _polylines = {
          Polyline(
            polylineId: const PolylineId('route'),
            points: improved,
            color: AppColors.secondary,
            width: 5,
          ),
        };
      });
    }
  }

  List<LatLng> _nearestNeighborOrder(LatLng start, List<LatLng> points) {
    final remaining = List<LatLng>.from(points);
    final route = <LatLng>[];
    var current = start;
    while (remaining.isNotEmpty) {
      remaining.sort(
        (a, b) => _distance(current, a).compareTo(_distance(current, b)),
      );
      final next = remaining.removeAt(0);
      route.add(next);
      current = next;
    }
    return route;
  }

  List<LatLng> _twoOptImprove(List<LatLng> path) {
    bool improved = true;
    while (improved) {
      improved = false;
      for (int i = 1; i < path.length - 2; i++) {
        for (int k = i + 1; k < path.length - 1; k++) {
          final before = _pathLength(path);
          final newPath = _twoOptSwap(path, i, k);
          if (_pathLength(newPath) < before) {
            path = newPath;
            improved = true;
          }
        }
      }
    }
    return path;
  }

  List<LatLng> _twoOptSwap(List<LatLng> path, int i, int k) {
    final result = <LatLng>[];
    result.addAll(path.sublist(0, i));
    result.addAll(path.sublist(i, k + 1).reversed);
    result.addAll(path.sublist(k + 1));
    return result;
  }

  double _pathLength(List<LatLng> path) {
    double sum = 0;
    for (int i = 0; i < path.length - 1; i++) {
      sum += _distance(path[i], path[i + 1]);
    }
    return sum;
  }

  double _distance(LatLng a, LatLng b) {
    final dx = a.latitude - b.latitude;
    final dy = a.longitude - b.longitude;
    return (dx * dx + dy * dy).abs();
  }
}
