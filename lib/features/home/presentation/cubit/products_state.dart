import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/category.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/product.dart';
import 'package:ahmed_mossad_flutter_task/features/home/domain/entities/subcategory.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Category> categories;
  final List<SubCategory> subcategories;
  final List<Product> products;

  const ProductsLoaded({
    required this.categories,
    required this.subcategories,
    required this.products,
  });

  @override
  List<Object?> get props => [categories, subcategories, products];
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object?> get props => [message];
}
