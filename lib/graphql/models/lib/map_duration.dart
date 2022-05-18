import "package:equatable/equatable.dart";

class MapDuration extends Equatable {
  final double? value;
  final String? text;
  MapDuration({this.value, this.text});

  static MapDuration fromJson(Map<dynamic, dynamic> json) {
    return MapDuration(
      value: json['value']?.toDouble(),
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (value != null) _data['value'] = value;
    if (text != null) _data['text'] = text;
    return _data;
  }

  MapDuration copyWith({double? value, String? text}) {
    return MapDuration(value: value ?? this.value, text: text ?? this.text);
  }

  List<Object?> get props => [value, text];
}
