part of 'remove_from_favorites_bloc.dart';

abstract class RemoveFromFavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RemoveFromFavoritesStarted extends RemoveFromFavoritesEvent {
  @override
  List<Object?> get props => [];
}

class RemoveFromFavoritesExcuted extends RemoveFromFavoritesEvent {
  RemoveFromFavoritesExcuted();
  @override
  List<Object?> get props => [];
}

class RemoveFromFavoritesIsLoading extends RemoveFromFavoritesEvent {
  final UserResponse data;
  RemoveFromFavoritesIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class RemoveFromFavoritesIsOptimistic extends RemoveFromFavoritesEvent {
  final UserResponse data;
  RemoveFromFavoritesIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class RemoveFromFavoritesIsConcrete extends RemoveFromFavoritesEvent {
  final UserResponse data;
  RemoveFromFavoritesIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class RemoveFromFavoritesErrored extends RemoveFromFavoritesEvent {
  final UserResponse data;
  final String message;
  RemoveFromFavoritesErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class RemoveFromFavoritesFailed extends RemoveFromFavoritesEvent {
  final UserResponse data;
  final String message;
  RemoveFromFavoritesFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class RemoveFromFavoritesReseted extends RemoveFromFavoritesEvent {
  @override
  List<Object?> get props => [];
}

class RemoveFromFavoritesRefreshed extends RemoveFromFavoritesEvent {
  final RemoveFromFavoritesState data;
  RemoveFromFavoritesRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class RemoveFromFavoritesRetried extends RemoveFromFavoritesEvent {
  @override
  List<Object?> get props => [];
}
