import 'transit_agency.dart';
import 'transit_vehicle.dart';

import "package:equatable/equatable.dart";

class TransitLine extends Equatable {
  final String? name;
  final String? short$name;
  final String? color;
  final List<TransitAgency>? agencies;
  final String? url;
  final String? icon;
  final String? text$color;
  final TransitVehicle? vehicle;
  TransitLine(
      {this.name,
      this.short$name,
      this.color,
      this.agencies,
      this.url,
      this.icon,
      this.text$color,
      this.vehicle});

  static TransitLine fromJson(Map<dynamic, dynamic> json) {
    return TransitLine(
      name: json['name'],
      short$name: json['short_name'],
      color: json['color'],
      agencies: json['agencies'] != null
          ? List.generate(json['agencies'].length,
              (index) => TransitAgency.fromJson(json['agencies'][index]))
          : null,
      url: json['url'],
      icon: json['icon'],
      text$color: json['text_color'],
      vehicle: json['vehicle'] != null
          ? TransitVehicle.fromJson(json['vehicle'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (name != null) _data['name'] = name;
    if (short$name != null) _data['short_name'] = short$name;
    if (color != null) _data['color'] = color;
    if (agencies != null)
      _data['agencies'] = List.generate(
          agencies?.length ?? 0, (index) => agencies![index].toJson());
    if (url != null) _data['url'] = url;
    if (icon != null) _data['icon'] = icon;
    if (text$color != null) _data['text_color'] = text$color;
    if (vehicle != null) _data['vehicle'] = vehicle!.toJson();
    return _data;
  }

  TransitLine copyWith(
      {String? name,
      String? short$name,
      String? color,
      List<TransitAgency>? agencies,
      String? url,
      String? icon,
      String? text$color,
      TransitVehicle? vehicle}) {
    return TransitLine(
        name: name ?? this.name,
        short$name: short$name ?? this.short$name,
        color: color ?? this.color,
        agencies: agencies ?? this.agencies,
        url: url ?? this.url,
        icon: icon ?? this.icon,
        text$color: text$color ?? this.text$color,
        vehicle: vehicle ?? this.vehicle);
  }

  List<Object?> get props => [
        name,
        short$name,
        color,
        List.from(agencies ?? []),
        url,
        icon,
        text$color,
        vehicle
      ];
}
