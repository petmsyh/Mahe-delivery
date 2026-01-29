import 'package:flutter/material.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/constants/user_role.dart';

class RouteNavigator {
  static void navigateBasedOnRole(BuildContext context, UserRole? role) {
    String route;
    switch (role) {
      case UserRole.customer:
        route = RouteConstants.customerHome;
        break;
      case UserRole.vendor:
        route = RouteConstants.vendorHome;
        break;
      case UserRole.rider:
        route = RouteConstants.riderHome;
        break;
      case UserRole.admin:
      case UserRole.superAdmin:
        route = RouteConstants.adminHome;
        break;
      default:
        route = RouteConstants.customerHome;
    }
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
