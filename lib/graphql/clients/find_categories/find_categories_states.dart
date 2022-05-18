part of 'find_categories_bloc.dart';

abstract class FindCategoriesState extends Equatable {
  final CategoryListResponse? data;
  final String? message;
  FindCategoriesState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesInitial extends FindCategoriesState {
  @override
  List<Object?> get props => [];
}

class FindCategoriesSuccess extends FindCategoriesState {
  final CategoryListResponse data;
  final String? message;
  FindCategoriesSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesFailure extends FindCategoriesState {
  final CategoryListResponse data;
  final String? message;
  FindCategoriesFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesInProgress extends FindCategoriesState {
  final CategoryListResponse data;
  final String? message;
  FindCategoriesInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesOptimistic extends FindCategoriesState {
  final CategoryListResponse data;
  final String? message;
  FindCategoriesOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesError extends FindCategoriesState {
  final CategoryListResponse data;
  final String? message;
  FindCategoriesError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesLoadMoreInProgress extends FindCategoriesState {
  final CategoryListResponse data;
  final String? message;
  FindCategoriesLoadMoreInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindCategoriesAllDataLoaded extends FindCategoriesState {
  final CategoryListResponse data;
  final String? message;
  FindCategoriesAllDataLoaded({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
