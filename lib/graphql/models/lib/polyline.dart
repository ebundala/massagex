import "package:equatable/equatable.dart";

class Polyline extends Equatable {
  final String? points;
  Polyline({this.points});

  static Polyline fromJson(Map<dynamic, dynamic> json) {
    return Polyline(
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (points != null) _data['points'] = points;
    return _data;
  }

  Polyline copyWith({String? points}) {
    return Polyline(points: points ?? this.points);
  }

  List<Object?> get props => [points];
}
