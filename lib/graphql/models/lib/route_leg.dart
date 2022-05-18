import 'directions_step.dart';
import 'map_distance.dart';
import 'map_duration.dart';
import 'map_time.dart';
import 'lat_lng.dart';

import "package:equatable/equatable.dart";

class RouteLeg extends Equatable {
  final List<DirectionsStep>? steps;
  final MapDistance? distance;
  final MapDuration? duration;
  final MapDuration? duration$in$traffic;
  final MapTime? arrival$time;
  final MapTime? departure$time;
  final LatLng? start$location;
  final LatLng? end$location;
  final String? start$address;
  final String? end$address;
  RouteLeg(
      {this.steps,
      this.distance,
      this.duration,
      this.duration$in$traffic,
      this.arrival$time,
      this.departure$time,
      this.start$location,
      this.end$location,
      this.start$address,
      this.end$address});

  static RouteLeg fromJson(Map<dynamic, dynamic> json) {
    return RouteLeg(
      steps: json['steps'] != null
          ? List.generate(json['steps'].length,
              (index) => DirectionsStep.fromJson(json['steps'][index]))
          : null,
      distance: json['distance'] != null
          ? MapDistance.fromJson(json['distance'])
          : null,
      duration: json['duration'] != null
          ? MapDuration.fromJson(json['duration'])
          : null,
      duration$in$traffic: json['duration_in_traffic'] != null
          ? MapDuration.fromJson(json['duration_in_traffic'])
          : null,
      arrival$time: json['arrival_time'] != null
          ? MapTime.fromJson(json['arrival_time'])
          : null,
      departure$time: json['departure_time'] != null
          ? MapTime.fromJson(json['departure_time'])
          : null,
      start$location: json['start_location'] != null
          ? LatLng.fromJson(json['start_location'])
          : null,
      end$location: json['end_location'] != null
          ? LatLng.fromJson(json['end_location'])
          : null,
      start$address: json['start_address'],
      end$address: json['end_address'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (steps != null)
      _data['steps'] =
          List.generate(steps?.length ?? 0, (index) => steps![index].toJson());
    if (distance != null) _data['distance'] = distance!.toJson();
    if (duration != null) _data['duration'] = duration!.toJson();
    if (duration$in$traffic != null)
      _data['duration_in_traffic'] = duration$in$traffic!.toJson();
    if (arrival$time != null) _data['arrival_time'] = arrival$time!.toJson();
    if (departure$time != null)
      _data['departure_time'] = departure$time!.toJson();
    if (start$location != null)
      _data['start_location'] = start$location!.toJson();
    if (end$location != null) _data['end_location'] = end$location!.toJson();
    if (start$address != null) _data['start_address'] = start$address;
    if (end$address != null) _data['end_address'] = end$address;
    return _data;
  }

  RouteLeg copyWith(
      {List<DirectionsStep>? steps,
      MapDistance? distance,
      MapDuration? duration,
      MapDuration? duration$in$traffic,
      MapTime? arrival$time,
      MapTime? departure$time,
      LatLng? start$location,
      LatLng? end$location,
      String? start$address,
      String? end$address}) {
    return RouteLeg(
        steps: steps ?? this.steps,
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        duration$in$traffic: duration$in$traffic ?? this.duration$in$traffic,
        arrival$time: arrival$time ?? this.arrival$time,
        departure$time: departure$time ?? this.departure$time,
        start$location: start$location ?? this.start$location,
        end$location: end$location ?? this.end$location,
        start$address: start$address ?? this.start$address,
        end$address: end$address ?? this.end$address);
  }

  List<Object?> get props => [
        List.from(steps ?? []),
        distance,
        duration,
        duration$in$traffic,
        arrival$time,
        departure$time,
        start$location,
        end$location,
        start$address,
        end$address
      ];
}
