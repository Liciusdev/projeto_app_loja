import '../../models/product_model.dart';

abstract class RecommendedProductsState {}

class RecommendedProductsInitial extends RecommendedProductsState {}

class RecommendedProductsLoading extends RecommendedProductsState {}

class RecommendedProductsLoaded extends RecommendedProductsState {
  final List<Product> products;
  RecommendedProductsLoaded(this.products);
}

class RecommendedProductsError extends RecommendedProductsState {
  final String message;
  RecommendedProductsError(this.message);
}
