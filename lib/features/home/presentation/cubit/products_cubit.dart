import 'package:ahmed_mossad_flutter_task/features/home/domain/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository repository;

  ProductsCubit(this.repository) : super(ProductsInitial());

  Future<void> loadAllData() async {
    emit(ProductsLoading());
    try {
      final categories = await repository.getCategories();
      final subcategories = await repository.getSubCategories();
      final products = await repository.getProducts();

      emit(
        ProductsLoaded(
          categories: categories,
          subcategories: subcategories,
          products: products,
        ),
      );
    } catch (e) {
      emit(ProductsError('حدث خطأ أثناء تحميل البيانات: $e'));
    }
  }
}
