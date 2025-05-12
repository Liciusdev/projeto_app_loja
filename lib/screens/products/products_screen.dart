import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/products/products_bloc.dart';
import '../../blocs/products/products_event.dart';
import '../../blocs/products/products_state.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();
    _productsBloc = ProductsBloc()..add(FetchProducts());
    _productsBloc.add(FetchProducts());
  }

  @override
  void dispose() {
    _productsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productsBloc,
      child: Scaffold(
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
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsError) {
              return Center(child: Text('Erro: ${state.message}'));
            } else if (state is ProductsLoaded) {
              final products = state.products;
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
                    subtitle: Text(
                      'R\$ ${product.price?.toStringAsFixed(2) ?? '0.00'}',
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product_details',
                        arguments: product,
                      );
                    },
                    
                  );
                },
              );
            }
            return const SizedBox.shrink();
            
          },
        ),
      ),
    );
  }
}
