part of 'find_categories_bloc.dart';

abstract class FindCategoriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindCategoriesStarted extends FindCategoriesEvent {
  @override
  List<Object?> get props => [];
}

class FindCategoriesExcuted extends FindCategoriesEvent {
  FindCategoriesExcuted();
  @override
  List<Object?> get props => [];
}

class FindCategoriesIsLoading extends FindCategoriesEvent {
  final CategoryListResponse data;
  FindCategoriesIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindCategoriesIsOptimistic extends FindCategoriesEvent {
  final CategoryListResponse data;
  FindCategoriesIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindCategoriesIsConcrete extends FindCategoriesEvent {
  final CategoryListResponse data;
  FindCategoriesIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindCategoriesErrored extends FindCategoriesEvent {
  final CategoryListResponse data;
  final String message;
  FindCategoriesErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesFailed extends FindCategoriesEvent {
  final CategoryListResponse data;
  final String message;
  FindCategoriesFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesReseted extends FindCategoriesEvent {
  @override
  List<Object?> get props => [];
}

class FindCategoriesRefreshed extends FindCategoriesEvent {
  final FindCategoriesState data;
  FindCategoriesRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindCategoriesMoreLoaded extends FindCategoriesEvent {
  FindCategoriesMoreLoaded();
  @override
  List<Object?> get props => [];
}

class FindCategoriesStreamEnded extends FindCategoriesEvent {
  @override
  List<Object?> get props => [];
}

class FindCategoriesRetried extends FindCategoriesEvent {
  @override
  List<Object?> get props => [];
}
