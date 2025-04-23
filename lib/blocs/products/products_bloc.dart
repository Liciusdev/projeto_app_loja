import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_event.dart';
import 'products_state.dart';
import '../../services/api_services.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState>{
ProductsBloc() : super(ProductsInitial()){
  on<FetchProducts>((event, emit) async {
    emit(ProductsLoading());
    try {
      final products = await ApiServices.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  });
}

}