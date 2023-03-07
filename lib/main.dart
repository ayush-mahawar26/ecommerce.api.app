import 'package:ecommerce_api/constants/size_config.dart';
import 'package:ecommerce_api/constants/theme.dart';
import 'package:ecommerce_api/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getThemeData(),
      onGenerateRoute: AppRouter().getRoutes,
      initialRoute: "/home",
    );
  }
}
