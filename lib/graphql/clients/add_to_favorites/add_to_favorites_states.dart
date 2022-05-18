part of 'add_to_favorites_bloc.dart';

abstract class AddToFavoritesState extends Equatable {
  final UserResponse? data;
  final String? message;
  AddToFavoritesState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class AddToFavoritesInitial extends AddToFavoritesState {
  @override
  List<Object?> get props => [];
}

class AddToFavoritesSuccess extends AddToFavoritesState {
  final UserResponse data;
  final String? message;
  AddToFavoritesSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class AddToFavoritesFailure extends AddToFavoritesState {
  final UserResponse data;
  final String? message;
  AddToFavoritesFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class AddToFavoritesInProgress extends AddToFavoritesState {
  final UserResponse data;
  final String? message;
  AddToFavoritesInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class AddToFavoritesOptimistic extends AddToFavoritesState {
  final UserResponse data;
  final String? message;
  AddToFavoritesOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class AddToFavoritesError extends AddToFavoritesState {
  final UserResponse data;
  final String? message;
  AddToFavoritesError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
