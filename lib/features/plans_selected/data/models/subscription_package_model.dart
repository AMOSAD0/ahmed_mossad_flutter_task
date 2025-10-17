// lib/features/subscription_packages/data/models/subscription_package_model.dart
import '../../domain/entities/subscription_package.dart';

class SubscriptionPackageModel extends SubscriptionPackage {
  const SubscriptionPackageModel({
    required super.id,
    required super.name,
    required super.price,
    required super.currency,
    required super.validityDays,
    required super.subscribersCount,
    required super.features,
    super.badge,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'currency': currency,
      'validityDays': validityDays,
      'subscribersCount': subscribersCount,
      'features': features.join(','), // نحولها لنص عشان SQLite
      'badge': badge,
    };
  }

  factory SubscriptionPackageModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionPackageModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      currency: map['currency'],
      validityDays: map['validityDays'],
      subscribersCount: map['subscribersCount'],
      features: (map['features'] as String).split(','),
      badge: map['badge'],
    );
  }
}
