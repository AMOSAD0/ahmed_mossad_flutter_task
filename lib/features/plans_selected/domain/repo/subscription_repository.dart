import '../entities/subscription_package.dart';

abstract class SubscriptionRepository {
  Future<List<SubscriptionPackage>> getAllPackages();
}
