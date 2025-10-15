class SubscriptionPackage {
  final String id;
  final String name;
  final double price;
  final String currency;
  final bool isSelected;
  final int validityDays;
  final int subscribersCount;
  final List<String> features;
  final String? badge;

  SubscriptionPackage({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.isSelected,
    required this.validityDays,
    required this.subscribersCount,
    required this.features,
    this.badge,
  });
}
