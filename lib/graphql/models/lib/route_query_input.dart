import 'lat_lng_input.dart';
import 'travel_mode.dart';
import 'travel_restriction.dart';
import 'language.dart';
import 'unit_system.dart';
import 'traffic_model.dart';
import 'transit_mode.dart';
import 'transit_routing_preference.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class RouteQueryInput extends Equatable {
  final LatLngInput origin;
  final LatLngInput destination;
  final TravelMode? mode;
  final List<LatLngInput>? waypoints;
  final bool? alternatives;
  final List<TravelRestriction>? avoid;
  final Language? language;
  final UnitSystem? units;
  final String? region;
  final DateTime? arrival$time;
  final DateTime? departure$time;
  final TrafficModel? traffic$model;
  final List<TransitMode>? transit$mode;
  final TransitRoutingPreference? transit$routing$preference;
  final bool? optimize;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      origin.getFilesVariables(
          field_name: '${field_name}_origin', variables: variables);
    }

    {
      destination.getFilesVariables(
          field_name: '${field_name}_destination', variables: variables);
    }

    if (waypoints != null) {
      int i = -1;
      waypoints!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_waypoints_$i', variables: variables);
      });
    }
    return variables;
  }

  List<ast.VariableDefinitionNode> getVariableDefinitionsNodes({
    required Map<String, dynamic> variables,
  }) {
    final List<ast.VariableDefinitionNode> vars = [];
    variables.forEach((key, value) {
      vars.add(ast.VariableDefinitionNode(
        variable: ast.VariableNode(name: ast.NameNode(value: key)),
        type: ast.NamedTypeNode(
            name: ast.NameNode(value: 'Upload'), isNonNull: true),
        defaultValue: ast.DefaultValueNode(value: null),
        directives: [],
      ));
    });
    return vars;
  }

  ast.ObjectValueNode toValueNode({required String field_name}) {
    return ast.ObjectValueNode(fields: [
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'origin'),
        value: origin.toValueNode(field_name: '${field_name}_origin'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'destination'),
        value: destination.toValueNode(field_name: '${field_name}_destination'),
      ),
      if (mode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mode'),
          value: ast.EnumValueNode(name: ast.NameNode(value: mode!.toJson())),
        ),
      if (waypoints != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'waypoints'),
            value: ast.ListValueNode(values: [
              ...waypoints!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_waypoints_$i')
                  ];
                },
              )
            ])),
      if (alternatives != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'alternatives'),
          value: ast.BooleanValueNode(value: alternatives!),
        ),
      if (avoid != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avoid'),
          value: ast.ListValueNode(
            values: [
              ...avoid!.fold([], (v, e) {
                // ignore: unused_local_variable
                int i = v.length;
                return [
                  ...v,
                  ast.EnumValueNode(name: ast.NameNode(value: '${e.toJson()}'))
                ];
              })
            ],
          ),
        ),
      if (language != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'language'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: language!.toJson())),
        ),
      if (units != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'units'),
          value: ast.EnumValueNode(name: ast.NameNode(value: units!.toJson())),
        ),
      if (region != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'region'),
          value: ast.StringValueNode(value: '${region!}', isBlock: false),
        ),
      if (arrival$time != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'arrival_time'),
          value: ast.StringValueNode(
              value: arrival$time!.toIso8601String(), isBlock: false),
        ),
      if (departure$time != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'departure_time'),
          value: ast.StringValueNode(
              value: departure$time!.toIso8601String(), isBlock: false),
        ),
      if (traffic$model != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'traffic_model'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: traffic$model!.toJson())),
        ),
      if (transit$mode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transit_mode'),
          value: ast.ListValueNode(
            values: [
              ...transit$mode!.fold([], (v, e) {
                // ignore: unused_local_variable
                int i = v.length;
                return [
                  ...v,
                  ast.EnumValueNode(name: ast.NameNode(value: '${e.toJson()}'))
                ];
              })
            ],
          ),
        ),
      if (transit$routing$preference != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transit_routing_preference'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: transit$routing$preference!.toJson())),
        ),
      if (optimize != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'optimize'),
          value: ast.BooleanValueNode(value: optimize!),
        )
    ]);
  }

  RouteQueryInput(
      {required this.origin,
      required this.destination,
      this.mode,
      this.waypoints,
      this.alternatives,
      this.avoid,
      this.language,
      this.units,
      this.region,
      this.arrival$time,
      this.departure$time,
      this.traffic$model,
      this.transit$mode,
      this.transit$routing$preference,
      this.optimize});

  static RouteQueryInput fromJson(Map<dynamic, dynamic> json) {
    return RouteQueryInput(
      origin: LatLngInput.fromJson(json['origin']),
      destination: LatLngInput.fromJson(json['destination']),
      mode: json['mode'] != null ? TravelModeExt.fromJson(json['mode']) : null,
      waypoints: json['waypoints'] != null
          ? List.generate(json['waypoints'].length,
              (index) => LatLngInput.fromJson(json['waypoints'][index]))
          : null,
      alternatives: json['alternatives'],
      avoid: json['avoid'] != null
          ? List.generate(json['avoid'].length,
              (index) => TravelRestrictionExt.fromJson(json['avoid'][index]))
          : null,
      language: json['language'] != null
          ? LanguageExt.fromJson(json['language'])
          : null,
      units:
          json['units'] != null ? UnitSystemExt.fromJson(json['units']) : null,
      region: json['region'],
      arrival$time: json['arrival_time'] != null
          ? DateTime.parse(json['arrival_time'])
          : null,
      departure$time: json['departure_time'] != null
          ? DateTime.parse(json['departure_time'])
          : null,
      traffic$model: json['traffic_model'] != null
          ? TrafficModelExt.fromJson(json['traffic_model'])
          : null,
      transit$mode: json['transit_mode'] != null
          ? List.generate(json['transit_mode'].length,
              (index) => TransitModeExt.fromJson(json['transit_mode'][index]))
          : null,
      transit$routing$preference: json['transit_routing_preference'] != null
          ? TransitRoutingPreferenceExt.fromJson(
              json['transit_routing_preference'])
          : null,
      optimize: json['optimize'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['origin'] = origin.toJson();

    _data['destination'] = destination.toJson();
    if (mode != null) _data['mode'] = mode!.toJson();
    if (waypoints != null)
      _data['waypoints'] = List.generate(
          waypoints?.length ?? 0, (index) => waypoints![index].toJson());
    if (alternatives != null) _data['alternatives'] = alternatives;
    if (avoid != null)
      _data['avoid'] =
          List.generate(avoid?.length ?? 0, (index) => avoid![index].toJson());
    if (language != null) _data['language'] = language!.toJson();
    if (units != null) _data['units'] = units!.toJson();
    if (region != null) _data['region'] = region;
    if (arrival$time != null) _data['arrival_time'] = arrival$time!.toString();
    if (departure$time != null)
      _data['departure_time'] = departure$time!.toString();
    if (traffic$model != null) _data['traffic_model'] = traffic$model!.toJson();
    if (transit$mode != null)
      _data['transit_mode'] = List.generate(
          transit$mode?.length ?? 0, (index) => transit$mode![index].toJson());
    if (transit$routing$preference != null)
      _data['transit_routing_preference'] =
          transit$routing$preference!.toJson();
    if (optimize != null) _data['optimize'] = optimize;
    return _data;
  }

  RouteQueryInput copyWith(
      {LatLngInput? origin,
      LatLngInput? destination,
      TravelMode? mode,
      List<LatLngInput>? waypoints,
      bool? alternatives,
      List<TravelRestriction>? avoid,
      Language? language,
      UnitSystem? units,
      String? region,
      DateTime? arrival$time,
      DateTime? departure$time,
      TrafficModel? traffic$model,
      List<TransitMode>? transit$mode,
      TransitRoutingPreference? transit$routing$preference,
      bool? optimize}) {
    return RouteQueryInput(
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        mode: mode ?? this.mode,
        waypoints: waypoints ?? this.waypoints,
        alternatives: alternatives ?? this.alternatives,
        avoid: avoid ?? this.avoid,
        language: language ?? this.language,
        units: units ?? this.units,
        region: region ?? this.region,
        arrival$time: arrival$time ?? this.arrival$time,
        departure$time: departure$time ?? this.departure$time,
        traffic$model: traffic$model ?? this.traffic$model,
        transit$mode: transit$mode ?? this.transit$mode,
        transit$routing$preference:
            transit$routing$preference ?? this.transit$routing$preference,
        optimize: optimize ?? this.optimize);
  }

  List<Object?> get props => [
        origin,
        destination,
        mode,
        List.from(waypoints ?? []),
        alternatives,
        List.from(avoid ?? []),
        language,
        units,
        region,
        arrival$time,
        departure$time,
        traffic$model,
        List.from(transit$mode ?? []),
        transit$routing$preference,
        optimize
      ];
}
