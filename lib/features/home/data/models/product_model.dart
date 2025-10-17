import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.price,
    required super.isDiscounted,
    required super.discount,
    required super.soldCount,
    required super.categoryId,
    required super.subCategoryId,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['image_url'] ?? '',
      price: map['price'] * 1.0,
      isDiscounted: map['is_discounted'] == 1,
      discount: map['discount'] * 1.0,
      soldCount: map['sold_count'] ?? 0,
      categoryId: map['category_id'] ?? 0,
      subCategoryId: map['subcategory_id'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'image_url': imageUrl,
    'price': price,
    'is_discounted': isDiscounted ? 1 : 0,
    'discount': discount,
    'sold_count': soldCount,
    'category_id': categoryId,
    'subcategory_id': subCategoryId,
  };
}
