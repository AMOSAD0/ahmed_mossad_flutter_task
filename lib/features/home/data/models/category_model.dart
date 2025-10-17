import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(id: map['id'] as int, name: map['name'] as String);
  }

  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}
