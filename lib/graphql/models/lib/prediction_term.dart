import "package:equatable/equatable.dart";

class PredictionTerm extends Equatable {
  final String? value;
  final int? offset;
  PredictionTerm({this.value, this.offset});

  static PredictionTerm fromJson(Map<dynamic, dynamic> json) {
    return PredictionTerm(
      value: json['value'],
      offset: json['offset'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (value != null) _data['value'] = value;
    if (offset != null) _data['offset'] = offset;
    return _data;
  }

  PredictionTerm copyWith({String? value, int? offset}) {
    return PredictionTerm(
        value: value ?? this.value, offset: offset ?? this.offset);
  }

  List<Object?> get props => [value, offset];
}
