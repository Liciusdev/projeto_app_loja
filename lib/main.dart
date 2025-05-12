import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'package:projeto_app_loja/models/product_model.dart';
import 'screens/products/product_detail_screen.dart';

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
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.productDetail){
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          );
        }
        return null;
      },
    );
  }
}