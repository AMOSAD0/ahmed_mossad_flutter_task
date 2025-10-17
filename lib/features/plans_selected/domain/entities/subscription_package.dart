// lib/features/subscription_packages/domain/entities/subscription_package.dart
class SubscriptionPackage {
  final String id;
  final String name;
  final int price;
  final String currency;
  final int validityDays;
  final int subscribersCount;
  final List<String> features;
  final String? badge;

  const SubscriptionPackage({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.validityDays,
    required this.subscribersCount,
    required this.features,
    this.badge,
  });
}
