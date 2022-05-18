import 'transit_stop.dart';
import 'map_time.dart';
import 'transit_line.dart';

import "package:equatable/equatable.dart";

class TransitDetails extends Equatable {
  final TransitStop? arrival$stop;
  final TransitStop? departure$stop;
  final MapTime? arrival$time;
  final MapTime? departure$time;
  final String? headsign;
  final double? headway;
  final double? num$stops;
  final TransitLine? line;
  TransitDetails(
      {this.arrival$stop,
      this.departure$stop,
      this.arrival$time,
      this.departure$time,
      this.headsign,
      this.headway,
      this.num$stops,
      this.line});

  static TransitDetails fromJson(Map<dynamic, dynamic> json) {
    return TransitDetails(
      arrival$stop: json['arrival_stop'] != null
          ? TransitStop.fromJson(json['arrival_stop'])
          : null,
      departure$stop: json['departure_stop'] != null
          ? TransitStop.fromJson(json['departure_stop'])
          : null,
      arrival$time: json['arrival_time'] != null
          ? MapTime.fromJson(json['arrival_time'])
          : null,
      departure$time: json['departure_time'] != null
          ? MapTime.fromJson(json['departure_time'])
          : null,
      headsign: json['headsign'],
      headway: json['headway']?.toDouble(),
      num$stops: json['num_stops']?.toDouble(),
      line: json['line'] != null ? TransitLine.fromJson(json['line']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (arrival$stop != null) _data['arrival_stop'] = arrival$stop!.toJson();
    if (departure$stop != null)
      _data['departure_stop'] = departure$stop!.toJson();
    if (arrival$time != null) _data['arrival_time'] = arrival$time!.toJson();
    if (departure$time != null)
      _data['departure_time'] = departure$time!.toJson();
    if (headsign != null) _data['headsign'] = headsign;
    if (headway != null) _data['headway'] = headway;
    if (num$stops != null) _data['num_stops'] = num$stops;
    if (line != null) _data['line'] = line!.toJson();
    return _data;
  }

  TransitDetails copyWith(
      {TransitStop? arrival$stop,
      TransitStop? departure$stop,
      MapTime? arrival$time,
      MapTime? departure$time,
      String? headsign,
      double? headway,
      double? num$stops,
      TransitLine? line}) {
    return TransitDetails(
        arrival$stop: arrival$stop ?? this.arrival$stop,
        departure$stop: departure$stop ?? this.departure$stop,
        arrival$time: arrival$time ?? this.arrival$time,
        departure$time: departure$time ?? this.departure$time,
        headsign: headsign ?? this.headsign,
        headway: headway ?? this.headway,
        num$stops: num$stops ?? this.num$stops,
        line: line ?? this.line);
  }

  List<Object?> get props => [
        arrival$stop,
        departure$stop,
        arrival$time,
        departure$time,
        headsign,
        headway,
        num$stops,
        line
      ];
}
