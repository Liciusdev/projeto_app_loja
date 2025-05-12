import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/products/recommended_products_state.dart';
import '../blocs/products/recommended_products_bloc.dart';

class RecommendedProducts extends StatefulWidget {
  final String category;
  final int currentProductId;

  const RecommendedProducts({
    super.key,
    required this.category,
    required this.currentProductId,
  });

  @override
  State<RecommendedProducts> createState() => _RecommendedProductsState();
}

class _RecommendedProductsState extends State<RecommendedProducts> {
  late RecommendedProductsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = RecommendedProductsCubit();
    _cubit.fetchRecommended(widget.category, widget.currentProductId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<RecommendedProductsCubit, RecommendedProductsState>(
        builder: (context, state) {
          if (state is RecommendedProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecommendedProductsLoaded) {
        if (state.products.isEmpty) {
          return Center(child: Text('Não há produtos recomendados para esta categoria'));
        } else {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Produtos Recomendados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product_details',
                          arguments: product,
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                              product.imageUrl ??
                                  'https://via.placeholder.com/150',
                              height: 50,
                              width: 50,
                              fit: BoxFit.contain,
                            ),
                            Text(product.title ?? 'Produto sem título'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
            );
          }
        }
        return const SizedBox.shrink();
      },
    ),
  );
}
}