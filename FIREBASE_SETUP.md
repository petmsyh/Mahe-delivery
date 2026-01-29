# Firebase Configuration Guide

## Setup Instructions

1. Create a Firebase project at https://console.firebase.google.com

2. For Android:
   - Download `google-services.json`
   - Place it in `android/app/` directory

3. For iOS:
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/` directory

4. Enable the following Firebase services:
   - Firebase Authentication (Phone Authentication)
   - Cloud Firestore
   - Firebase Realtime Database
   - Firebase Storage
   - Firebase Cloud Messaging

5. Configure Firebase Authentication:
   - Enable Phone Sign-in method
   - Set up SHA-1 and SHA-256 keys for Android

6. Set up Firestore Security Rules (example):
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    match /restaurants/{restaurantId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
    
    match /orders/{orderId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null;
    }
  }
}
```

7. Set up Realtime Database Rules (example):
```
{
  "rules": {
    "rider_locations": {
      "$riderId": {
        ".read": true,
        ".write": "auth != null && auth.uid == $riderId"
      }
    }
  }
}
```
