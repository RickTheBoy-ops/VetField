import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../payment/presentation/providers/payment_provider.dart';
import '../../domain/entities/appointment_entity.dart';
import '../providers/appointment_provider.dart';
import '../../../pets/presentation/providers/pets_provider.dart';

class BookingScreen extends ConsumerStatefulWidget {
  final String vetId;
  final String vetName;
  final double basePrice;

  const BookingScreen({
    super.key,
    required this.vetId,
    required this.vetName,
    required this.basePrice,
  });

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _petNameController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _selectedTime = const TimeOfDay(hour: 9, minute: 0);
  AppointmentType _selectedType = AppointmentType.consultation;
  bool _isProcessingPayment = false;
  String? _selectedPetId;
  String? _selectedPetName;

  @override
  void dispose() {
    _petNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _processPaymentAndBooking() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isProcessingPayment = true);

    try {
      // 1. Criar PaymentIntent no backend
      await ref.read(paymentControllerProvider.notifier).createPaymentIntent(
        amount: widget.basePrice,
        description: 'Consulta - ${widget.vetName}',
      );

      final paymentState = ref.read(paymentControllerProvider);
      
      if (!paymentState.hasValue || paymentState.value == null) {
        throw Exception('Falha ao criar PaymentIntent');
      }

      final clientSecret = paymentState.value!;

      // 2. Inicializar PaymentSheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'VetField',
          style: ThemeMode.system,
        ),
      );

      // 3. Apresentar PaymentSheet
      await Stripe.instance.presentPaymentSheet();

      // 4. Se o pagamento foi bem-sucedido, criar o agendamento
      final dateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      final petName = _selectedPetName ?? _petNameController.text;
      await ref.read(appointmentControllerProvider.notifier).createAppointment(
        vetId: widget.vetId,
        petId: _selectedPetId,
        petName: petName,
        dateTime: dateTime,
        type: _selectedType,
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
      );

      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pagamento realizado e agendamento confirmado!'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();

    } on StripeException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro no pagamento: ${e.error.localizedMessage}'),
          backgroundColor: AppColors.error,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isProcessingPayment = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Consulta'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vet Info Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.medical_services, color: AppColors.primary, size: 32),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.vetName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'Preço: R\$ ${widget.basePrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Pet Selection
              Consumer(builder: (context, ref, _) {
                final petsAsync = ref.watch(myPetsControllerProvider);
                return petsAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Text('Erro ao carregar pets: $e'),
                  data: (pets) {
                    if (pets.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Você não possui pets cadastrados.',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () => context.push('/pet'),
                            icon: const Icon(Icons.add),
                            label: const Text('Cadastrar Pet'),
                          ),
                        ],
                      );
                    }
                    _selectedPetId ??= pets.first.id;
                    _selectedPetName ??= pets.first.name;
                    return DropdownButtonFormField<String>(
                      initialValue: _selectedPetId,
                      items: pets
                          .map((p) => DropdownMenuItem(
                                value: p.id,
                                child: Text(p.name),
                              ))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          _selectedPetId = v;
                          final pet = pets.firstWhere((p) => p.id == v);
                          _selectedPetName = pet.name;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Selecione o Pet',
                        prefixIcon: const Icon(Icons.pets),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                );
              }),
              
              const SizedBox(height: 24),
              
              // Type Selector
              DropdownButtonFormField<AppointmentType>(
                initialValue: _selectedType,
                decoration: InputDecoration(
                  labelText: 'Tipo de Atendimento',
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: AppointmentType.values.map((type) {
                  String label = '';
                  switch (type) {
                    case AppointmentType.consultation: label = 'Consulta'; break;
                    case AppointmentType.vaccine: label = 'Vacina'; break;
                    case AppointmentType.exam: label = 'Exame'; break;
                    case AppointmentType.surgery: label = 'Cirurgia'; break;
                  }
                  return DropdownMenuItem(
                    value: type,
                    child: Text(label),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedType = value);
                  }
                },
              ),
              
              const SizedBox(height: 24),
              
              // Date & Time Row
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Data',
                          prefixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectTime(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Hora',
                          prefixIcon: const Icon(Icons.access_time),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _selectedTime.format(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Notes
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Observações (Sintomas, etc)',
                  alignLabelWithHint: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Icon(Icons.note),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Payment Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isProcessingPayment ? null : _processPaymentAndBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: _isProcessingPayment
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.payment, color: Colors.white),
                  label: Text(
                    _isProcessingPayment ? 'Processando...' : 'Pagar e Confirmar',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
