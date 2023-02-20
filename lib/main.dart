import 'package:flutter/material.dart';
import 'package:happy_toys/utils/routes/routes.dart';
import 'package:happy_toys/utils/routes/routes_name.dart';
import 'package:sizer/sizer.dart';
import 'package:happy_toys/view_model/auth_view_model.dart';
import 'package:happy_toys/view_model/cart_orders_view_model.dart';
import 'package:happy_toys/view_model/cart_view_model.dart';
import 'package:happy_toys/view_model/productslist_view_model.dart';
import 'package:happy_toys/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => RegisterViewModel()),
          ChangeNotifierProvider(create: (_) => ProductsListViewModel()),
          ChangeNotifierProvider(create: (_) => CartViewModel()),
          ChangeNotifierProvider(create: (_) => CartOrdersViewModel()),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.login,
          onGenerateRoute: Routes.generateRoute,
          theme: ThemeData(
            fontFamily: 'Sofia sans',
            primarySwatch: Colors.blue,
          ),
          // home: FlutterExample(),
        ),
      );
    });

  }
}