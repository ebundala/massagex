part of 'report_abuse_bloc.dart';

abstract class ReportAbuseState extends Equatable {
  final UserResponse? data;
  final String? message;
  ReportAbuseState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReportAbuseInitial extends ReportAbuseState {
  @override
  List<Object?> get props => [];
}

class ReportAbuseSuccess extends ReportAbuseState {
  final UserResponse data;
  final String? message;
  ReportAbuseSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReportAbuseFailure extends ReportAbuseState {
  final UserResponse data;
  final String? message;
  ReportAbuseFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReportAbuseInProgress extends ReportAbuseState {
  final UserResponse data;
  final String? message;
  ReportAbuseInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReportAbuseOptimistic extends ReportAbuseState {
  final UserResponse data;
  final String? message;
  ReportAbuseOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReportAbuseError extends ReportAbuseState {
  final UserResponse data;
  final String? message;
  ReportAbuseError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
