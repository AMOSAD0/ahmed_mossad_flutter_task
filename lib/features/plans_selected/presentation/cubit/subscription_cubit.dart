// lib/features/subscription_packages/presentation/cubit/subscription_cubit.dart
import 'package:ahmed_mossad_flutter_task/features/plans_selected/domain/repo/subscription_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/subscription_package.dart';
import 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscriptionRepository repository;

  SubscriptionCubit(this.repository) : super(SubscriptionInitial());

  Future<void> loadPackages() async {
    try {
      emit(SubscriptionLoading());
      final List<SubscriptionPackage> packages = await repository
          .getAllPackages();
      emit(SubscriptionLoaded(packages));
    } catch (e) {
      emit(SubscriptionError('حدث خطأ أثناء تحميل الباقات'));
    }
  }
}
