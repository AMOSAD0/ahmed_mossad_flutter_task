class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final bool isDiscounted;
  final double discount;
  final int soldCount;
  final int categoryId;
  final int subCategoryId;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.isDiscounted,
    required this.discount,
    required this.soldCount,
    required this.categoryId,
    required this.subCategoryId,
  });
}
