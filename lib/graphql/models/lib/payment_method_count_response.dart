import "package:equatable/equatable.dart";

class PaymentMethodCountResponse extends Equatable {
  final bool? status;
  final int? data;
  final String? message;
  PaymentMethodCountResponse({this.status, this.data, this.message});

  static PaymentMethodCountResponse fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodCountResponse(
      status: json['status'],
      data: json['data'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (data != null) _data['data'] = data;
    if (message != null) _data['message'] = message;
    return _data;
  }

  PaymentMethodCountResponse copyWith(
      {bool? status, int? data, String? message}) {
    return PaymentMethodCountResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
