# Changelog

All notable changes to Mahe Delivery will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial project structure with clean architecture
- Firebase integration (Auth, Firestore, Realtime Database, Storage, Messaging)
- Phone authentication with OTP verification
- Role-based access control (Customer, Vendor, Rider, Admin)
- Customer features:
  - Home screen with category browsing
  - Restaurant listing and browsing
  - Shopping cart functionality
  - Order history with real-time updates
  - Profile management
- Vendor features:
  - Dashboard with statistics
  - Menu management (add, edit, delete items)
  - Order management interface
- Rider features:
  - Dashboard with earnings overview
  - Online/offline status toggle
  - Delivery status tracking
- Admin features:
  - User management screen
  - Vendor approval and management
  - Configuration screen for app settings
  - Grid-based dashboard
- Core services:
  - Authentication service
  - Restaurant service
  - Order service
  - Location tracking service
  - Notification service
  - Storage service for image uploads
- Shared components:
  - Reusable widgets (LoadingWidget, EmptyStateWidget, ErrorWidget)
  - Custom input components (CustomButton, CustomTextField)
  - Data models (User, Restaurant, MenuItem, Order, Rider, Payment, Address)
- Utility helpers:
  - DateTime formatting
  - Currency formatting
  - Distance calculation
  - Input validators
- Documentation:
  - Comprehensive README
  - Firebase setup guide
  - Security documentation (OWASP compliance)
  - Deployment guide
  - Privacy policy
  - Contributing guidelines

### Security
- Implemented OWASP mobile security best practices
- Firebase security rules documentation
- Input validation on all forms
- Secure authentication with Firebase Auth
- HTTPS/TLS for all communications

## [1.0.0] - 2026-01-29

### Added
- Initial release
- Basic project structure
- Core dependencies configured

---

## Version History

### Future Releases

#### [1.1.0] - Planned
- Map integration with Leaflet/OpenStreetMap
- Real-time order tracking with live map
- Payment gateway integration (Telebirr, Chapa)
- Restaurant detail screen with menu
- Checkout and payment flow
- Telegram bot integration for vendor uploads
- Push notifications implementation

#### [1.2.0] - Planned
- Rider navigation with turn-by-turn directions
- Advanced filtering and search
- Ratings and reviews system
- Order scheduling
- Promo codes and discounts
- Multi-language support (English, Amharic)

#### [1.3.0] - Planned
- Analytics dashboard for admins
- Sales reports for vendors
- Earnings history for riders
- Complaint management system
- In-app chat support
- Loyalty program

#### [2.0.0] - Planned
- AI-based restaurant recommendations
- Voice ordering
- Group orders
- Subscription-based delivery
- Multi-city expansion
- Advanced analytics

---

## Notes

- **Breaking Changes**: Will be clearly marked in version releases
- **Security Updates**: Released as patches immediately
- **Bug Fixes**: Included in minor version updates
- **New Features**: Included in minor/major version updates
