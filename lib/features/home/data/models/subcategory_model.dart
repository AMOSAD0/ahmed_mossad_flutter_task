import '../../domain/entities/subcategory.dart';

class SubCategoryModel extends SubCategory {
  SubCategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image_url'] as String,
    );
  }

  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}
