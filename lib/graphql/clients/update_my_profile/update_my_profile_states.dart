part of 'update_my_profile_bloc.dart';

abstract class UpdateMyProfileState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateMyProfileState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileInitial extends UpdateMyProfileState {
  @override
  List<Object?> get props => [];
}

class UpdateMyProfileSuccess extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileFailure extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileInProgress extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileOptimistic extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileError extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
