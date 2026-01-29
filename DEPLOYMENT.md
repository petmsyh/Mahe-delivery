# Deployment Guide - Mahe Delivery App

## Pre-deployment Checklist

### 1. Code Quality
- [ ] All files under 100 lines (as per requirements)
- [ ] No hardcoded API keys or secrets
- [ ] All TODO comments resolved
- [ ] Code properly documented
- [ ] No debug/console logs in production code

### 2. Testing
- [ ] All unit tests passing
- [ ] Widget tests passing
- [ ] Integration tests completed
- [ ] Manual testing on multiple devices
- [ ] Performance testing completed

### 3. Firebase Configuration
- [ ] Production Firebase project set up
- [ ] Security rules properly configured
- [ ] Analytics enabled
- [ ] Crashlytics configured
- [ ] Cloud Functions deployed (if any)

### 4. App Configuration
- [ ] App version and build number updated
- [ ] App icons added for all platforms
- [ ] Splash screen configured
- [ ] App permissions properly set

## Android Deployment

### Step 1: Generate Signing Key
```bash
keytool -genkey -v -keystore ~/mahe-delivery-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias mahe-delivery
```

### Step 2: Configure Signing in `android/app/build.gradle`
```gradle
android {
    ...
    signingConfigs {
        release {
            storeFile file("path/to/mahe-delivery-key.jks")
            storePassword System.getenv("KEYSTORE_PASSWORD")
            keyAlias "mahe-delivery"
            keyPassword System.getenv("KEY_PASSWORD")
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
        }
    }
}
```

### Step 3: Build Release APK
```bash
flutter build apk --release --obfuscate --split-debug-info=build/debug-info
```

### Step 4: Build App Bundle (for Play Store)
```bash
flutter build appbundle --release --obfuscate --split-debug-info=build/debug-info
```

### Step 5: Upload to Google Play Console
1. Create app in Google Play Console
2. Fill in store listing information
3. Upload app bundle
4. Configure pricing and distribution
5. Complete content rating questionnaire
6. Submit for review

## iOS Deployment

### Step 1: Configure Xcode Project
1. Open `ios/Runner.xcworkspace` in Xcode
2. Set Team and Bundle Identifier
3. Configure signing certificates
4. Update version and build number

### Step 2: Build Release
```bash
flutter build ios --release --obfuscate --split-debug-info=build/debug-info
```

### Step 3: Archive and Upload
1. In Xcode, select Product > Archive
2. Once archived, click Distribute App
3. Select App Store Connect
4. Upload to App Store Connect

### Step 4: Submit to App Store
1. Login to App Store Connect
2. Create new app
3. Fill in app information
4. Add screenshots and descriptions
5. Submit for review

## Post-Deployment

### 1. Monitoring
- Enable Firebase Crashlytics
- Monitor Firebase Analytics
- Check for errors in logs
- Monitor user feedback

### 2. Version Management
- Tag release in Git: `git tag -a v1.0.0 -m "Release version 1.0.0"`
- Push tags: `git push origin --tags`
- Keep changelog updated

### 3. User Communication
- Notify users of new version
- Highlight new features
- Provide support channels

## Continuous Deployment (Optional)

### Using GitHub Actions

Create `.github/workflows/deploy.yml`:
```yaml
name: Deploy to Stores

on:
  push:
    tags:
      - 'v*'

jobs:
  deploy-android:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test
      - run: flutter build appbundle --release
      - name: Upload to Play Store
        uses: r0adkll/upload-google-play@v1
        with:
          serviceAccountJsonPlainText: ${{ secrets.PLAY_STORE_SERVICE_ACCOUNT }}
          packageName: com.mahedelivery.app
          releaseFiles: build/app/outputs/bundle/release/app-release.aab
          track: production

  deploy-ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test
      - run: flutter build ios --release --no-codesign
      # Additional iOS deployment steps
```

## Rollback Procedure

If issues are discovered after deployment:

1. **Google Play Store**: 
   - Create new release with previous version
   - Or halt rollout and fix issues

2. **App Store**: 
   - Submit new version with fixes
   - Or remove app from sale temporarily

## Support and Maintenance

### Regular Updates
- Security patches: Immediately
- Bug fixes: Within 1 week
- Feature updates: Monthly/Quarterly

### Monitoring Schedule
- Daily: Check crash reports
- Weekly: Review analytics
- Monthly: User feedback analysis
- Quarterly: Security audit

## Compliance

### Google Play Store Policies
- [x] Privacy policy provided
- [x] User data handling disclosed
- [x] Content rating completed
- [x] Target API level meets requirements

### App Store Policies
- [x] Privacy policy provided
- [x] App review guidelines followed
- [x] In-app purchases properly configured (if any)
- [x] Copyright permissions obtained
