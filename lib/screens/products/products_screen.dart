import 'package:flutter/material.dart';
import 'package:projeto_app_loja/models/product_model.dart';
import 'package:projeto_app_loja/services/api_services.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}
class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
             Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiServices.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum produto encontrado'));
        } else {
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: Image.network(
                  product.imageUrl ?? 'https://via.placeholder.com/50',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                title: Text(product.title ?? 'Título indisponível'),
                subtitle: Text('R\$ ${product.price?.toStringAsFixed(2) ?? '0.00'}'),
                onTap: () {
                  Navigator.pushNamed(context, '/product', arguments: product);
                },
              );
            },
          );
        }
      }),
    );
  }
}