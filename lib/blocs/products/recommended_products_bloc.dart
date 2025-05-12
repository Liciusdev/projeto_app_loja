import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/product_model.dart';
import 'recommended_products_state.dart';

class RecommendedProductsCubit extends Cubit<RecommendedProductsState> {
  RecommendedProductsCubit() : super(RecommendedProductsInitial());

  Future<void> fetchRecommended(String category, int currentProductId) async {
    emit(RecommendedProductsLoading());

    try {
      final url = Uri.parse('https://fakestoreapi.com/products/category/$category');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final products = data
            .map((json) => Product.fromJson(json))
            .where((p) => p.id != currentProductId)
            .toList();

        emit(RecommendedProductsLoaded(products));
      } else {
        emit(RecommendedProductsError('Erro ao carregar produtos'));
      }
    } catch (e) {
      emit(RecommendedProductsError(e.toString()));
    }
  }
}
