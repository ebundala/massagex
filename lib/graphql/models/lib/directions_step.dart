import 'map_distance.dart';
import 'map_duration.dart';
import 'lat_lng.dart';
import 'polyline.dart';
import 'transit_details.dart';

import "package:equatable/equatable.dart";

class DirectionsStep extends Equatable {
  final String? html$instructions;
  final MapDistance? distance;
  final MapDuration? duration;
  final LatLng? start$location;
  final LatLng? end$location;
  final String? maneuver;
  final Polyline? polyline;
  final DirectionsStep? steps;
  final TransitDetails? transit$details;
  DirectionsStep(
      {this.html$instructions,
      this.distance,
      this.duration,
      this.start$location,
      this.end$location,
      this.maneuver,
      this.polyline,
      this.steps,
      this.transit$details});

  static DirectionsStep fromJson(Map<dynamic, dynamic> json) {
    return DirectionsStep(
      html$instructions: json['html_instructions'],
      distance: json['distance'] != null
          ? MapDistance.fromJson(json['distance'])
          : null,
      duration: json['duration'] != null
          ? MapDuration.fromJson(json['duration'])
          : null,
      start$location: json['start_location'] != null
          ? LatLng.fromJson(json['start_location'])
          : null,
      end$location: json['end_location'] != null
          ? LatLng.fromJson(json['end_location'])
          : null,
      maneuver: json['maneuver'],
      polyline:
          json['polyline'] != null ? Polyline.fromJson(json['polyline']) : null,
      steps:
          json['steps'] != null ? DirectionsStep.fromJson(json['steps']) : null,
      transit$details: json['transit_details'] != null
          ? TransitDetails.fromJson(json['transit_details'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (html$instructions != null)
      _data['html_instructions'] = html$instructions;
    if (distance != null) _data['distance'] = distance!.toJson();
    if (duration != null) _data['duration'] = duration!.toJson();
    if (start$location != null)
      _data['start_location'] = start$location!.toJson();
    if (end$location != null) _data['end_location'] = end$location!.toJson();
    if (maneuver != null) _data['maneuver'] = maneuver;
    if (polyline != null) _data['polyline'] = polyline!.toJson();
    if (steps != null) _data['steps'] = steps!.toJson();
    if (transit$details != null)
      _data['transit_details'] = transit$details!.toJson();
    return _data;
  }

  DirectionsStep copyWith(
      {String? html$instructions,
      MapDistance? distance,
      MapDuration? duration,
      LatLng? start$location,
      LatLng? end$location,
      String? maneuver,
      Polyline? polyline,
      DirectionsStep? steps,
      TransitDetails? transit$details}) {
    return DirectionsStep(
        html$instructions: html$instructions ?? this.html$instructions,
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        start$location: start$location ?? this.start$location,
        end$location: end$location ?? this.end$location,
        maneuver: maneuver ?? this.maneuver,
        polyline: polyline ?? this.polyline,
        steps: steps ?? this.steps,
        transit$details: transit$details ?? this.transit$details);
  }

  List<Object?> get props => [
        html$instructions,
        distance,
        duration,
        start$location,
        end$location,
        maneuver,
        polyline,
        steps,
        transit$details
      ];
}
