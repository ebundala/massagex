import "package:equatable/equatable.dart";

class TransitFare extends Equatable {
  final String? currency;
  final double? value;
  final String? text;
  TransitFare({this.currency, this.value, this.text});

  static TransitFare fromJson(Map<dynamic, dynamic> json) {
    return TransitFare(
      currency: json['currency'],
      value: json['value']?.toDouble(),
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (currency != null) _data['currency'] = currency;
    if (value != null) _data['value'] = value;
    if (text != null) _data['text'] = text;
    return _data;
  }

  TransitFare copyWith({String? currency, double? value, String? text}) {
    return TransitFare(
        currency: currency ?? this.currency,
        value: value ?? this.value,
        text: text ?? this.text);
  }

  List<Object?> get props => [currency, value, text];
}
