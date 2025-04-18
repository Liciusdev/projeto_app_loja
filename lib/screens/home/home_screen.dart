import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Virtual'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/products');
              },
              child: const Text('Area do cliente'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/admin');
              },
              child: const Text('Area do Administrador'),
            ),
          ],
        ),
      ),
    );
  }
}