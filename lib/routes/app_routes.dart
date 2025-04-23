import 'package:flutter/material.dart';
import '../screens/admin/admin_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/products/products_screen.dart';
//import '../screens/products/product_detail_screen.dart';


class AppRoutes {
  static const String productDetail = '/product_details';
  
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomeScreen(),
    '/products': (context) => const ProductsScreen(),
    '/cart': (context) => const CartScreen(),
    '/admin': (context) => const AdminScreen(),
    
  };
}
// Compare this snippet from lib/main.dart: