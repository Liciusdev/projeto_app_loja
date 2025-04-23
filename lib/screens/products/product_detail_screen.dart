import 'package:flutter/material.dart';
import '../../models/product_model.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(product.title ?? 'Produto Detalhes'),
      ),
      body:  Center(
        child: Column(
          children: [
            Image.network(
              product.imageUrl ?? 'https://via.placeholder.com/150',
              height: 200,
              fit:BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              product.title ?? 'Título indisponível',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(product.description ?? 'Descrição indisponível'),
            const SizedBox(height: 16),
            Text(
              'R\$ ${product.price?.toStringAsFixed(2) ?? '0.00'}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // Adicionar ao carrinho
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Produto adicionado ao carrinho')),
                );
              },
             icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Adicionar ao carrinho'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

