import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Virtual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: AppRoutes.routes,
      // Removed the home property to avoid conflict with initialRoute
    );
  }
}