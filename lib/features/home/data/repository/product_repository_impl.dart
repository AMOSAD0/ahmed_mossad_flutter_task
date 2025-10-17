import 'package:ahmed_mossad_flutter_task/features/home/data/data_sources/product_local_data_source.dart';
import 'package:ahmed_mossad_flutter_task/features/home/data/models/category_model.dart';
import 'package:ahmed_mossad_flutter_task/features/home/data/models/product_model.dart';
import 'package:ahmed_mossad_flutter_task/features/home/data/models/subcategory_model.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/category.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/product.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/subcategory.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<Category>> getCategories() async {
    final db = await localDataSource.database;
    final data = await db.query('categories');
    return data.map((e) => CategoryModel.fromMap(e)).toList();
  }

  @override
  Future<List<SubCategory>> getSubCategories() async {
    final db = await localDataSource.database;
    final data = await db.query('subcategories');
    return data.map((e) => SubCategoryModel.fromMap(e)).toList();
  }

  @override
  Future<List<Product>> getProducts() async {
    final db = await localDataSource.database;
    final data = await db.query('products');
    return data.map((e) => ProductModel.fromMap(e)).toList();
  }
}
