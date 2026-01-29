# Mahe Delivery

A comprehensive food delivery mobile application built with Flutter following clean architecture principles. The app supports multiple user roles: Customers, Vendors, Riders, and Admins.

## Features

### Customer Features
- Phone number authentication with OTP
- Browse restaurants by category, rating, and distance
- View restaurant menus and place orders
- Shopping cart management
- Multiple payment methods (Cash on Delivery, Telebirr, Chapa)
- Real-time order tracking
- Order history
- User profile management

### Vendor Features
- Restaurant management dashboard
- Menu item management (add, edit, delete)
- Order management (accept/reject orders)
- Update order preparation status
- Sales reports (daily and monthly)
- Telegram integration for product uploads

### Rider Features
- Rider dashboard with earnings overview
- Accept/reject delivery requests
- Real-time navigation with map integration
- Update delivery status
- Earnings history

### Admin Features
- User management (customers, vendors, riders)
- Approve/suspend vendors and riders
- Live order monitoring
- Delivery fee configuration
- System analytics and reports
- Complaint and dispute handling

## Tech Stack

- **Framework**: Flutter SDK ^3.8.1
- **Backend**: Firebase (Authentication, Firestore, Realtime Database, Storage, Messaging)
- **State Management**: Provider
- **Maps**: Flutter Map with OpenStreetMap (Leaflet)
- **Architecture**: Clean Architecture with feature-based modular design

## Project Structure

```
lib/
├── core/
│   ├── config/          # App configuration (theme, routing)
│   ├── constants/       # Constants and enums
│   ├── errors/          # Error handling
│   ├── services/        # Firebase services
│   └── utils/           # Utilities and validators
├── features/
│   ├── auth/            # Authentication feature
│   ├── customer/        # Customer features
│   ├── vendor/          # Vendor features
│   ├── rider/           # Rider features
│   └── admin/           # Admin features
└── shared/
    ├── models/          # Data models
    ├── providers/       # State management providers
    └── widgets/         # Reusable widgets
```

## Getting Started

### Prerequisites

- Flutter SDK ^3.8.1 or higher
- Dart SDK
- Firebase account
- Android Studio / VS Code with Flutter extensions
- iOS development tools (for iOS builds)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/petmsyh/Mahe-delivery.git
cd Mahe-delivery
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project at https://console.firebase.google.com
   - Add Android and iOS apps to your Firebase project
   - Download and place configuration files:
     - `google-services.json` in `android/app/`
     - `GoogleService-Info.plist` in `ios/Runner/`
   - Enable Firebase services (see FIREBASE_SETUP.md for details)

4. Run the app:
```bash
flutter run
```

## Firebase Configuration

Refer to [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed Firebase configuration instructions including:
- Authentication setup
- Firestore database rules
- Realtime Database rules
- Storage rules
- Cloud Messaging setup

## Security

This application follows OWASP Mobile Application Security best practices:
- Secure authentication with Firebase Auth
- Data encryption in transit (HTTPS)
- Input validation and sanitization
- Secure storage for sensitive data
- Role-based access control

## Code Quality

- All source files are kept under 100 lines as per project requirements
- Clean separation of concerns (UI, business logic, data layer)
- Modular and maintainable codebase
- Follows Flutter and Dart best practices

## Testing

Run tests with:
```bash
flutter test
```

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Support

For support, email support@mahedelivery.com or create an issue in this repository.

## Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- OpenStreetMap for map data
