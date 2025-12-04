import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/appointment/presentation/screens/booking_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/vet/presentation/screens/vet_dashboard_screen.dart';
import '../../features/auth/presentation/screens/profile_edit_screen.dart';
import '../../features/health/presentation/screens/health_timeline_screen.dart';
import '../../features/vet/presentation/screens/vet_calendar_screen.dart';
import '../../features/vet/presentation/screens/prescription_screen.dart';
import '../../screens/home/home_screen.dart'; // Importando temporariamente da pasta antiga
import '../../screens/onboarding/onboarding_screen.dart'; // Importando temporariamente da pasta antiga
import '../../screens/appointments/appointments_screen.dart';
import '../../features/pets/presentation/screens/my_pets_screen.dart';
import '../../features/pets/presentation/screens/add_edit_pet_screen.dart';
import '../../features/pets/domain/entities/pet_entity.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      // Get current user from auth provider
      final user = ref.read(currentUserProvider);
      final isAuthenticated = user != null;
      
      // Define auth routes
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/onboarding';

      // Redirect unauthenticated users to login
      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      // Redirect authenticated users away from auth screens
      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }

      // No redirect needed
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile-edit',
        builder: (context, state) => const ProfileEditScreen(),
      ),
      GoRoute(
        path: '/health-timeline',
        builder: (context, state) => const HealthTimelineScreen(),
      ),
      GoRoute(
        path: '/vet-calendar',
        builder: (context, state) => const VetCalendarScreen(),
      ),
      GoRoute(
        path: '/prescription/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PrescriptionScreen(appointmentId: id);
        },
      ),
      GoRoute(
        path: '/vet-dashboard',
        builder: (context, state) => const VetDashboardScreen(),
      ),
      GoRoute(
        path: '/appointments',
        builder: (context, state) => const AppointmentsScreen(),
      ),
      GoRoute(
        path: '/my-pets',
        builder: (context, state) => const MyPetsScreen(),
      ),
      GoRoute(
        path: '/pet',
        builder: (context, state) {
          final pet = state.extra as PetEntity?;
          return AddEditPetScreen(pet: pet);
        },
      ),
      GoRoute(
        path: '/book/:vetId',
        builder: (context, state) {
          final vetId = state.pathParameters['vetId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return BookingScreen(
            vetId: vetId,
            vetName: extra?['vetName'] ?? 'Veterinário',
            basePrice: extra?['price'] ?? 0.0,
          );
        },
      ),
    ],
  );
}
