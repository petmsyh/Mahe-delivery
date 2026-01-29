# Firebase Data Structure Documentation

## Overview

This document describes the data structure used in Firestore and Realtime Database for the Mahe Delivery application.

## Firestore Collections

### 1. Users Collection (`users`)

Stores user account information for all user types.

```javascript
{
  "id": "string",              // User ID (Firebase Auth UID)
  "phoneNumber": "string",     // Phone number with country code
  "email": "string?",          // Optional email address
  "name": "string?",           // User's full name
  "role": "string",            // customer, vendor, rider, admin, superAdmin
  "profileImageUrl": "string?", // Profile picture URL
  "isActive": "boolean",       // Account active status
  "isVerified": "boolean",     // Verification status
  "createdAt": "timestamp",    // Account creation date
  "updatedAt": "timestamp?",   // Last update date
  "fcmToken": "string?"        // Firebase Cloud Messaging token
}
```

**Indexes**:
- `role` (ascending)
- `isActive` (ascending)
- `createdAt` (descending)

---

### 2. Restaurants Collection (`restaurants`)

Stores restaurant/vendor information.

```javascript
{
  "id": "string",                    // Restaurant ID
  "name": "string",                  // Restaurant name
  "description": "string",           // Description
  "imageUrl": "string",              // Main image URL
  "vendorId": "string",              // Owner user ID
  "rating": "number",                // Average rating (0-5)
  "totalRatings": "number",          // Total number of ratings
  "address": "string",               // Full address
  "latitude": "number",              // GPS latitude
  "longitude": "number",             // GPS longitude
  "isActive": "boolean",             // Operating status
  "isApproved": "boolean",           // Admin approval status
  "categories": ["string"],          // Food categories
  "phoneNumber": "string?",          // Contact number
  "deliveryFee": "number",           // Delivery charge
  "estimatedDeliveryTime": "number", // Minutes
  "createdAt": "timestamp"           // Creation date
}
```

**Indexes**:
- `isActive` + `isApproved` (compound)
- `rating` (descending)
- `categories` (array)

---

### 3. Menu Items Collection (`menu_items`)

Stores food items offered by restaurants.

```javascript
{
  "id": "string",              // Menu item ID
  "restaurantId": "string",    // Parent restaurant ID
  "name": "string",            // Item name
  "description": "string",     // Item description
  "price": "number",           // Price in currency
  "imageUrl": "string",        // Item image URL
  "category": "string",        // Food category
  "isAvailable": "boolean",    // Availability status
  "isVegetarian": "boolean",   // Dietary flag
  "preparationTime": "number", // Minutes
  "createdAt": "timestamp"     // Creation date
}
```

**Indexes**:
- `restaurantId` + `isAvailable` (compound)
- `category` (ascending)

---

### 4. Orders Collection (`orders`)

Stores customer orders.

```javascript
{
  "id": "string",              // Order ID
  "customerId": "string",      // Customer user ID
  "restaurantId": "string",    // Restaurant ID
  "restaurantName": "string",  // Restaurant name (denormalized)
  "items": [{                  // Order items array
    "menuItemId": "string",
    "name": "string",
    "price": "number",
    "quantity": "number",
    "specialInstructions": "string?"
  }],
  "subtotal": "number",        // Items total
  "deliveryFee": "number",     // Delivery charge
  "total": "number",           // Grand total
  "status": "string",          // placed, accepted, preparing, ready, picked_up, delivered, cancelled
  "riderId": "string?",        // Assigned rider ID
  "paymentMethod": "string",   // cash, telebirr, chapa
  "isPaid": "boolean",         // Payment status
  "deliveryAddress": "string", // Full delivery address
  "deliveryLatitude": "number",
  "deliveryLongitude": "number",
  "customerPhone": "string?",
  "specialInstructions": "string?",
  "createdAt": "timestamp",
  "updatedAt": "timestamp?",
  "deliveredAt": "timestamp?"
}
```

**Indexes**:
- `customerId` + `createdAt` (compound, descending)
- `restaurantId` + `createdAt` (compound, descending)
- `riderId` + `status` (compound)
- `status` (ascending)

---

### 5. Riders Collection (`riders`)

Stores delivery rider information.

```javascript
{
  "id": "string",              // Rider ID
  "userId": "string",          // User account ID
  "name": "string",            // Full name
  "phoneNumber": "string",     // Contact number
  "vehicleType": "string?",    // bicycle, motorcycle, car
  "vehicleNumber": "string?",  // Vehicle registration
  "licenseNumber": "string?",  // Driver's license
  "isVerified": "boolean",     // Admin verification status
  "isAvailable": "boolean",    // Currently available for deliveries
  "isActive": "boolean",       // Account active status
  "rating": "number",          // Average rating
  "totalDeliveries": "number", // Completed deliveries count
  "totalEarnings": "number",   // Total earnings
  "createdAt": "timestamp",
  "verifiedAt": "timestamp?"
}
```

**Indexes**:
- `isVerified` + `isAvailable` (compound)
- `rating` (descending)

---

### 6. Payments Collection (`payments`)

Stores payment transactions.

```javascript
{
  "id": "string",              // Payment ID
  "orderId": "string",         // Related order ID
  "customerId": "string",      // Customer ID
  "amount": "number",          // Payment amount
  "method": "string",          // cash, telebirr, chapa
  "status": "string",          // pending, completed, failed, cancelled
  "transactionId": "string?",  // External transaction ID
  "paymentProvider": "string?", // Payment gateway name
  "metadata": {},              // Additional payment data
  "createdAt": "timestamp",
  "completedAt": "timestamp?"
}
```

**Indexes**:
- `orderId` (ascending)
- `customerId` + `createdAt` (compound)
- `status` (ascending)

---

### 7. Notifications Collection (`notifications`)

Stores in-app notifications.

```javascript
{
  "id": "string",              // Notification ID
  "userId": "string",          // Recipient user ID
  "title": "string",           // Notification title
  "body": "string",            // Notification message
  "data": {},                  // Additional data
  "isRead": "boolean",         // Read status
  "createdAt": "timestamp"
}
```

**Indexes**:
- `userId` + `createdAt` (compound, descending)
- `isRead` (ascending)

---

### 8. Categories Collection (`categories`)

Stores food categories.

```javascript
{
  "id": "string",              // Category ID
  "name": "string",            // Category name
  "icon": "string",            // Icon name or URL
  "order": "number",           // Display order
  "isActive": "boolean"
}
```

---

### 9. Complaints Collection (`complaints`)

Stores customer complaints and disputes.

```javascript
{
  "id": "string",              // Complaint ID
  "orderId": "string",         // Related order ID
  "userId": "string",          // Complainant user ID
  "type": "string",            // order, delivery, payment, other
  "subject": "string",         // Complaint subject
  "description": "string",     // Detailed description
  "status": "string",          // pending, in_progress, resolved, closed
  "resolution": "string?",     // Resolution notes
  "createdAt": "timestamp",
  "resolvedAt": "timestamp?"
}
```

---

### 10. Config Collection (`config`)

Stores app-wide configuration.

```javascript
{
  "app_config": {
    "deliveryFee": "number",        // Default delivery fee
    "minimumOrder": "number",       // Minimum order amount
    "taxRate": "number",            // Tax percentage
    "serviceAreas": [{}],           // Supported delivery areas
    "operatingHours": {},           // Business hours
    "maintenanceMode": "boolean",   // Maintenance flag
    "updatedAt": "timestamp"
  }
}
```

---

## Realtime Database Structure

### Rider Locations (`rider_locations`)

Real-time rider location tracking.

```javascript
{
  "rider_locations": {
    "{riderId}": {
      "latitude": "number",
      "longitude": "number",
      "timestamp": "timestamp"
    }
  }
}
```

### Order Tracking (`order_tracking`)

Real-time order status updates.

```javascript
{
  "order_tracking": {
    "{orderId}": {
      "status": "string",
      "riderId": "string?",
      "estimatedArrival": "timestamp?",
      "lastUpdate": "timestamp"
    }
  }
}
```

---

## Cloud Storage Structure

```
/menu_images/{restaurantId}/{menuItemId}.jpg
/restaurant_images/{restaurantId}.jpg
/user_profiles/{userId}.jpg
```

---

## Security Notes

1. All timestamps use Firestore server timestamps
2. Sensitive data is never stored in plain text
3. Access controlled via Firebase Security Rules
4. User authentication required for most operations
5. Admin operations require elevated permissions

---

## Querying Best Practices

1. Use composite indexes for complex queries
2. Limit result sets with pagination
3. Cache frequently accessed data locally
4. Use real-time listeners sparingly
5. Implement offline persistence where appropriate
