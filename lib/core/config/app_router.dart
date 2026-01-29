import 'package:flutter/material.dart';
import '../constants/route_constants.dart';
import '../constants/user_role.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/otp_verification_screen.dart';
import '../../features/customer/presentation/customer_home_screen.dart';
import '../../features/customer/presentation/restaurant_list_screen.dart';
import '../../features/customer/presentation/cart_screen.dart';
import '../../features/customer/presentation/order_history_screen.dart';
import '../../features/customer/presentation/profile_screen.dart';
import '../../features/vendor/presentation/vendor_home_screen.dart';
import '../../features/vendor/presentation/menu_management_screen.dart';
import '../../features/rider/presentation/rider_home_screen.dart';
import '../../features/admin/presentation/admin_home_screen.dart';
import '../../features/admin/presentation/admin_users_screen.dart';
import '../../features/admin/presentation/admin_vendors_screen.dart';
import '../../features/admin/presentation/admin_config_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      
      case RouteConstants.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      
      case RouteConstants.otpVerification:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => OTPVerificationScreen(
            phoneNumber: args['phoneNumber'] as String,
            role: args['role'] as UserRole,
          ),
        );
      
      case RouteConstants.customerHome:
        return MaterialPageRoute(
          builder: (_) => const CustomerHomeScreen(),
        );
      
      case RouteConstants.restaurantList:
        return MaterialPageRoute(
          builder: (_) => const RestaurantListScreen(),
        );
      
      case RouteConstants.cart:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      
      case RouteConstants.orderHistory:
        return MaterialPageRoute(
          builder: (_) => const OrderHistoryScreen(),
        );
      
      case RouteConstants.customerProfile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      
      case RouteConstants.vendorHome:
        return MaterialPageRoute(
          builder: (_) => const VendorHomeScreen(),
        );
      
      case RouteConstants.menuManagement:
        return MaterialPageRoute(
          builder: (_) => const MenuManagementScreen(),
        );
      
      case RouteConstants.riderHome:
        return MaterialPageRoute(
          builder: (_) => const RiderHomeScreen(),
        );
      
      case RouteConstants.adminHome:
        return MaterialPageRoute(
          builder: (_) => const AdminHomeScreen(),
        );
      
      case RouteConstants.adminUsers:
        return MaterialPageRoute(
          builder: (_) => const AdminUsersScreen(),
        );
      
      case RouteConstants.adminVendors:
        return MaterialPageRoute(
          builder: (_) => const AdminVendorsScreen(),
        );
      
      case RouteConstants.adminConfig:
        return MaterialPageRoute(
          builder: (_) => const AdminConfigScreen(),
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
