import 'vehicle_type.dart';

import "package:equatable/equatable.dart";

class TransitVehicle extends Equatable {
  final String? name;
  final VehicleType? type;
  final String? icon;
  final String? local$icon;
  TransitVehicle({this.name, this.type, this.icon, this.local$icon});

  static TransitVehicle fromJson(Map<dynamic, dynamic> json) {
    return TransitVehicle(
      name: json['name'],
      type: json['type'] != null ? VehicleTypeExt.fromJson(json['type']) : null,
      icon: json['icon'],
      local$icon: json['local_icon'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (name != null) _data['name'] = name;
    if (type != null) _data['type'] = type!.toJson();
    if (icon != null) _data['icon'] = icon;
    if (local$icon != null) _data['local_icon'] = local$icon;
    return _data;
  }

  TransitVehicle copyWith(
      {String? name, VehicleType? type, String? icon, String? local$icon}) {
    return TransitVehicle(
        name: name ?? this.name,
        type: type ?? this.type,
        icon: icon ?? this.icon,
        local$icon: local$icon ?? this.local$icon);
  }

  List<Object?> get props => [name, type, icon, local$icon];
}
