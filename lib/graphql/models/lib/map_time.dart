import "package:equatable/equatable.dart";

class MapTime extends Equatable {
  final DateTime? value;
  final String? text;
  final String? time$zone;
  MapTime({this.value, this.text, this.time$zone});

  static MapTime fromJson(Map<dynamic, dynamic> json) {
    return MapTime(
      value: json['value'] != null ? DateTime.parse(json['value']) : null,
      text: json['text'],
      time$zone: json['time_zone'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (value != null) _data['value'] = value!.toString();
    if (text != null) _data['text'] = text;
    if (time$zone != null) _data['time_zone'] = time$zone;
    return _data;
  }

  MapTime copyWith({DateTime? value, String? text, String? time$zone}) {
    return MapTime(
        value: value ?? this.value,
        text: text ?? this.text,
        time$zone: time$zone ?? this.time$zone);
  }

  List<Object?> get props => [value, text, time$zone];
}
