import "package:equatable/equatable.dart";

class PredictionSubstring extends Equatable {
  final String? value;
  final int? offset;
  PredictionSubstring({this.value, this.offset});

  static PredictionSubstring fromJson(Map<dynamic, dynamic> json) {
    return PredictionSubstring(
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

  PredictionSubstring copyWith({String? value, int? offset}) {
    return PredictionSubstring(
        value: value ?? this.value, offset: offset ?? this.offset);
  }

  List<Object?> get props => [value, offset];
}
