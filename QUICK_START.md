# Quick Start Guide - Mahe Delivery

Get the Mahe Delivery app running locally in under 10 minutes!

## Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Git
- A Firebase account (free tier is sufficient)

## Step 1: Clone the Repository

```bash
git clone https://github.com/petmsyh/Mahe-delivery.git
cd Mahe-delivery
```

## Step 2: Install Dependencies

```bash
flutter pub get
```

## Step 3: Firebase Setup (Required)

### Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project named "Mahe Delivery"
3. Enable Google Analytics (optional)

### Configure Android

1. In Firebase Console, add an Android app
2. Package name: `com.mahedelivery.app` (or update in `android/app/build.gradle`)
3. Download `google-services.json`
4. Place it in `android/app/` directory

### Configure iOS

1. In Firebase Console, add an iOS app
2. Bundle ID: `com.mahedelivery.app` (or update in Xcode)
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

### Enable Firebase Services

In Firebase Console, enable:
- **Authentication** → Phone Sign-in method
- **Firestore Database** → Create database (start in test mode)
- **Realtime Database** → Create database (start in test mode)
- **Storage** → Get started
- **Cloud Messaging** → No additional setup needed

## Step 4: Update Firebase Security Rules

### Firestore Rules

Go to Firestore → Rules and paste:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### Realtime Database Rules

Go to Realtime Database → Rules and paste:

```json
{
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null"
  }
}
```

### Storage Rules

Go to Storage → Rules and paste:

```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## Step 5: Run the App

### Android

```bash
flutter run
```

### iOS (Mac only)

```bash
cd ios
pod install
cd ..
flutter run
```

## Step 6: Test the App

### Login Credentials

For development/testing, you can:

1. **Use Test Phone Numbers** (Configure in Firebase Console → Authentication → Phone):
   - Add test phone numbers like `+1 234 567 8900`
   - Set verification code like `123456`

2. **Use Real Phone Numbers** (Requires SMS quota in Firebase)

### Test User Roles

When logging in, select role:
- **Customer** - To browse restaurants and place orders
- **Vendor** - To manage restaurant and menu
- **Rider** - To view deliveries
- **Admin** - To manage users and vendors

## Common Issues & Solutions

### Issue: Build fails with Firebase error

**Solution**: Make sure `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) are in the correct directories.

### Issue: Phone authentication not working

**Solution**: 
1. Enable Phone Sign-in in Firebase Console
2. For Android, add SHA-1 and SHA-256 keys to Firebase project
3. Re-download and replace `google-services.json`

### Issue: CocoaPods errors on iOS

**Solution**:
```bash
cd ios
pod deintegrate
pod install
cd ..
```

### Issue: "No Firebase App" error

**Solution**: Make sure `Firebase.initializeApp()` is called in `main()` before `runApp()`.

## Development Tips

### Hot Reload

Press `r` in terminal or use IDE hot reload button to see changes instantly.

### Debugging

- Use Flutter DevTools: `flutter pub global activate devtools`
- View logs: `flutter logs`
- Check for errors: `flutter analyze`

### Code Format

Format your code before committing:
```bash
flutter format .
```

### Check for Issues

```bash
flutter analyze
```

## Project Structure Overview

```
lib/
├── core/           # Core functionality
│   ├── config/    # App config, theme, routing
│   ├── constants/ # Constants and enums
│   ├── errors/    # Error handling
│   ├── services/  # Firebase services
│   └── utils/     # Utilities
├── features/      # Features by role
│   ├── auth/      # Authentication
│   ├── customer/  # Customer features
│   ├── vendor/    # Vendor features
│   ├── rider/     # Rider features
│   └── admin/     # Admin features
└── shared/        # Shared across features
    ├── models/    # Data models
    ├── providers/ # State management
    └── widgets/   # Reusable widgets
```

## Next Steps

1. **Read the Documentation**:
   - [README.md](README.md) - Project overview
   - [FIREBASE_SETUP.md](FIREBASE_SETUP.md) - Detailed Firebase setup
   - [SECURITY.md](SECURITY.md) - Security guidelines
   - [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute

2. **Explore the Code**:
   - Start with `lib/main.dart`
   - Check out feature modules in `lib/features/`
   - Review service layer in `lib/core/services/`

3. **Start Developing**:
   - Pick a feature from the backlog
   - Create a new branch
   - Make your changes
   - Test thoroughly
   - Submit a pull request

## Getting Help

- **Issues**: Create an issue on GitHub
- **Questions**: Check existing issues or documentation
- **Email**: dev@mahedelivery.com (if available)

## Useful Commands

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run

# Build APK
flutter build apk

# Build iOS
flutter build ios

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
flutter format .

# Clean build
flutter clean

# Check Flutter installation
flutter doctor
```

## IDE Setup

### VS Code Extensions

- Flutter
- Dart
- Firebase Explorer
- Error Lens
- GitLens

### Android Studio Plugins

- Flutter
- Dart
- Firebase

## Congratulations! 🎉

You now have the Mahe Delivery app running locally. Start exploring and building amazing features!

For detailed information, check out the comprehensive documentation in the repository.

Happy coding! 🚀
