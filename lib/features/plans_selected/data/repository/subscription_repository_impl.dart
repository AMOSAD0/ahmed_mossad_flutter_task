import 'package:ahmed_mossad_flutter_task/features/plans_selected/data/data_sources/subscription_local_data_source.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/domain/repo/subscription_repository.dart';

import '../../domain/entities/subscription_package.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionLocalDataSource localDataSource;

  SubscriptionRepositoryImpl(this.localDataSource);

  @override
  Future<List<SubscriptionPackage>> getAllPackages() async {
    return await localDataSource.getAllPackages();
  }
}
