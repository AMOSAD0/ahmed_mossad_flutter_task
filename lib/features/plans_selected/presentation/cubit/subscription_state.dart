import 'package:equatable/equatable.dart';
import '../../domain/entities/subscription_package.dart';

abstract class SubscriptionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionLoading extends SubscriptionState {}

class SubscriptionLoaded extends SubscriptionState {
  final List<SubscriptionPackage> packages;
  SubscriptionLoaded(this.packages);

  @override
  List<Object?> get props => [packages];
}

class SubscriptionError extends SubscriptionState {
  final String message;
  SubscriptionError(this.message);

  @override
  List<Object?> get props => [message];
}

class SubscriptionToggle extends SubscriptionState {}
