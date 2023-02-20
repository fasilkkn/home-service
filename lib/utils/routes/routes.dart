import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_toys/model/user_model.dart';
import 'package:happy_toys/utils/routes/routes_name.dart';
import 'package:happy_toys/view/booking_screen.dart';
import 'package:happy_toys/view/bookingdetails_screen.dart';
import 'package:happy_toys/view/cart_view.dart';
import 'package:happy_toys/view/signup_screen.dart';
import 'package:happy_toys/view/view_bookings.dart';
import '../../view/home_screen.dart';
import '../../view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case RouteNames.register:
        return MaterialPageRoute(builder: (context) => const SignupScreen(),);
      case RouteNames.vieworders:
        return MaterialPageRoute(builder: (context) => const ViewBookings(),);
      case RouteNames.booking_screen:
        return MaterialPageRoute(builder: (context) => const BookingScreen(),);
      case RouteNames.bookingdetails:
        return MaterialPageRoute(builder: (context) => const BookingDetails(),);
      case RouteNames.cartpage:
        return MaterialPageRoute(builder: (context) => const CartView(),);
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No page found'),
            ),
          );
        });
    }
  }
}
