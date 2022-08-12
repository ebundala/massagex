part of 'recover_account_bloc.dart';

abstract class RecoverAccountState extends Equatable {
  final unknown? data;
  final String? message;
  RecoverAccountState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RecoverAccountInitial extends RecoverAccountState {
  @override
  List<Object?> get props => [];
}

class RecoverAccountSuccess extends RecoverAccountState {
  final unknown data;
  final String? message;
  RecoverAccountSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RecoverAccountFailure extends RecoverAccountState {
  final unknown data;
  final String? message;
  RecoverAccountFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RecoverAccountInProgress extends RecoverAccountState {
  final unknown data;
  final String? message;
  RecoverAccountInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RecoverAccountOptimistic extends RecoverAccountState {
  final unknown data;
  final String? message;
  RecoverAccountOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RecoverAccountError extends RecoverAccountState {
  final unknown data;
  final String? message;
  RecoverAccountError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
