import "package:equatable/equatable.dart";

class MapDistance extends Equatable {
  final double? value;
  final String? text;
  MapDistance({this.value, this.text});

  static MapDistance fromJson(Map<dynamic, dynamic> json) {
    return MapDistance(
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

  MapDistance copyWith({double? value, String? text}) {
    return MapDistance(value: value ?? this.value, text: text ?? this.text);
  }

  List<Object?> get props => [value, text];
}
