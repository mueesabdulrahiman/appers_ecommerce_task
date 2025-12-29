import 'package:appers_ecommerce_app/providers/cart_provider.dart';
import 'package:appers_ecommerce_app/providers/product_provider.dart';
import 'package:appers_ecommerce_app/screens/main_screen.dart';
import 'package:appers_ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Appers E-Commerce App',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          fontFamily: 'Poppins',
        ),
        home: MainScreen(),
      ),
    );
  }
}
