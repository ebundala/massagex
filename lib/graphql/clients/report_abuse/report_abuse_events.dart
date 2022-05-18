part of 'report_abuse_bloc.dart';

abstract class ReportAbuseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReportAbuseStarted extends ReportAbuseEvent {
  @override
  List<Object?> get props => [];
}

class ReportAbuseExcuted extends ReportAbuseEvent {
  ReportAbuseExcuted();
  @override
  List<Object?> get props => [];
}

class ReportAbuseIsLoading extends ReportAbuseEvent {
  final UserResponse data;
  ReportAbuseIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReportAbuseIsOptimistic extends ReportAbuseEvent {
  final UserResponse data;
  ReportAbuseIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReportAbuseIsConcrete extends ReportAbuseEvent {
  final UserResponse data;
  ReportAbuseIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReportAbuseErrored extends ReportAbuseEvent {
  final UserResponse data;
  final String message;
  ReportAbuseErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReportAbuseFailed extends ReportAbuseEvent {
  final UserResponse data;
  final String message;
  ReportAbuseFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class ReportAbuseReseted extends ReportAbuseEvent {
  @override
  List<Object?> get props => [];
}

class ReportAbuseRefreshed extends ReportAbuseEvent {
  final ReportAbuseState data;
  ReportAbuseRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class ReportAbuseRetried extends ReportAbuseEvent {
  @override
  List<Object?> get props => [];
}
