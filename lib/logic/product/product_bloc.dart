import 'package:bloc/bloc.dart';
import 'package:block_lesson/data/models/product_model.dart';
import 'package:block_lesson/service/api_service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc(this.apiService) : super(ProductInitial()) {
    on<LoadProductsEvent>((event, emit) async {

      emit(ProductLoading());
      try {
        final products = await apiService.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        print(e);
        emit(ProductError("Failed to load products"));
      }
    });
  }
}
