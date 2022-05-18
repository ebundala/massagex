part of 'add_to_favorites_bloc.dart';

abstract class AddToFavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToFavoritesStarted extends AddToFavoritesEvent {
  @override
  List<Object?> get props => [];
}

class AddToFavoritesExcuted extends AddToFavoritesEvent {
  AddToFavoritesExcuted();
  @override
  List<Object?> get props => [];
}

class AddToFavoritesIsLoading extends AddToFavoritesEvent {
  final UserResponse data;
  AddToFavoritesIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class AddToFavoritesIsOptimistic extends AddToFavoritesEvent {
  final UserResponse data;
  AddToFavoritesIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class AddToFavoritesIsConcrete extends AddToFavoritesEvent {
  final UserResponse data;
  AddToFavoritesIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class AddToFavoritesErrored extends AddToFavoritesEvent {
  final UserResponse data;
  final String message;
  AddToFavoritesErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class AddToFavoritesFailed extends AddToFavoritesEvent {
  final UserResponse data;
  final String message;
  AddToFavoritesFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class AddToFavoritesReseted extends AddToFavoritesEvent {
  @override
  List<Object?> get props => [];
}

class AddToFavoritesRefreshed extends AddToFavoritesEvent {
  final AddToFavoritesState data;
  AddToFavoritesRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class AddToFavoritesRetried extends AddToFavoritesEvent {
  @override
  List<Object?> get props => [];
}
