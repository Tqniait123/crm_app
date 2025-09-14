part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeModel homeModel;

  const HomeSuccess(this.homeModel);

  @override
  List<Object> get props => [homeModel];
}

class HomeCreating extends HomeState {}

class HomeCreated extends HomeState {
  final String message;

  const HomeCreated(this.message);

  @override
  List<Object> get props => [message];
}

class HomeUpdating extends HomeState {}

class HomeUpdated extends HomeState {
  final String message;

  const HomeUpdated(this.message);

  @override
  List<Object> get props => [message];
}

class HomeDeleting extends HomeState {}

class HomeDeleted extends HomeState {
  final String message;

  const HomeDeleted(this.message);

  @override
  List<Object> get props => [message];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
