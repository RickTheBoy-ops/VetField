/// Dados mockados para o aplicativo VetField
class MockData {
  // Categorias de serviços
  static const categories = [
    {'id': 1, 'name': 'Banho & Tosa', 'icon': 'scissors'},
    {'id': 2, 'name': 'Hotel Pet', 'icon': 'home'},
    {'id': 3, 'name': 'Consulta', 'icon': 'stethoscope'},
    {'id': 4, 'name': 'Outros', 'icon': 'more-horizontal'},
  ];
  
  // Próximo agendamento
  static const upcomingAppointment = {
    'type': 'Banho e Tosa',
    'date': '20 Dez, 2024',
    'time': '09:00',
    'location': 'Hospital Veterinário PetField',
    'image': 'https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?q=80&w=200&auto=format&fit=crop'
  };
  
  // Clínicas próximas
  static const nearbyClinics = [
    {
      'id': 1,
      'name': 'Clínica Pet Vida',
      'location': 'Centro, 1.2km',
      'rating': 4.8,
      'reviews': 324,
      'image': 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?q=80&w=400&auto=format&fit=crop'
    },
    {
      'id': 2,
      'name': 'Hospital Vet 24h',
      'location': 'Jd. Paulista, 2.5km',
      'rating': 4.9,
      'reviews': 850,
      'image': 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=400&auto=format&fit=crop'
    },
  ];
  
  // Melhores veterinários
  static const topVets = [
    {
      'id': 1,
      'name': 'Dra. Júlia Lima',
      'specialty': 'Dermatologista',
      'rating': 4.9,
      'image': 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?q=80&w=200&auto=format&fit=crop',
      'available': '14:30 - 18:00'
    },
    {
      'id': 2,
      'name': 'Dr. Lucas Silva',
      'specialty': 'Cirurgião',
      'rating': 4.8,
      'image': 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=200&auto=format&fit=crop',
      'available': '09:00 - 12:30'
    },
  ];
}
