# VetField 🐾

**VetField** is a modern Flutter application designed to connect pet owners with veterinary professionals. It simplifies the process of finding vets, booking appointments, and managing pet health records.

## 📱 Features

### 👤 For Pet Owners
- **Find Vets:** Search for veterinarians by location, specialty, price, and rating.
- **Interactive Map:** View nearby clinics and vets on a Google Map with custom markers.
- **Book Appointments:** Schedule appointments easily with real-time availability.
- **Health Timeline:** Track your pet's vaccines, exams, and medical history in a visual timeline.
- **SOS Mode:** Quickly find the nearest available vet in emergencies.
- **VetRide:** Integration with Uber to request a ride to the clinic.

### 👨‍⚕️ For Veterinarians
- **Dashboard:** Manage appointments and view daily schedules.
- **Patient Records:** Access pet health histories and owner details.
- **Availability:** Set working hours and manage consultation types.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (Dart)
- **State Management:** [Riverpod](https://riverpod.dev/) (Code Generation & AsyncNotifier)
- **Backend & Auth:** [Supabase](https://supabase.com/) (PostgreSQL, Auth, Realtime, Edge Functions)
- **Navigation:** [GoRouter](https://pub.dev/packages/go_router)
- **Maps:** [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- **Code Generation:** `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (Latest Stable)
- Dart SDK
- Supabase Account & Project

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/RickTheBoy-ops/VetField.git
   cd VetField/vetfield_flutter
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Environment Setup**
   Create a `.env` file in the root directory and add your Supabase credentials:
   ```env
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   GOOGLE_MAPS_API_KEY=your_google_maps_key
   ```

4. **Code Generation**
   Run the build runner to generate required files:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the App**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── core/            # Core utilities, theme, router, and shared providers
├── features/        # Feature-based architecture (Auth, Appointment, Owner, Health, Vet)
│   ├── data/        # Repositories, Data Sources, Models
│   ├── domain/      # Entities, Use Cases, Repository Interfaces
│   └── presentation/# Screens, Widgets, Providers (Controllers)
├── screens/         # General screens (Splash, Onboarding, Navigation)
└── widgets/         # Shared UI components
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
