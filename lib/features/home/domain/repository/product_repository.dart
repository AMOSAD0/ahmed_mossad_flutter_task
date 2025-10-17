import '../entities/product.dart';
import '../entities/category.dart';
import '../entities/subcategory.dart';

abstract class ProductRepository {
  Future<List<Category>> getCategories();
  Future<List<SubCategory>> getSubCategories();
  Future<List<Product>> getProducts();
}
