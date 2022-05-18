import "package:equatable/equatable.dart";

class AddressComponent extends Equatable {
  final List<String>? types;
  final String? long$name;
  final String? short$name;
  AddressComponent({this.types, this.long$name, this.short$name});

  static AddressComponent fromJson(Map<dynamic, dynamic> json) {
    return AddressComponent(
      types: json['types'] != null
          ? List.generate(
              json['types'].length, (index) => json['types'][index] as String)
          : null,
      long$name: json['long_name'],
      short$name: json['short_name'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (types != null) _data['types'] = types;
    if (long$name != null) _data['long_name'] = long$name;
    if (short$name != null) _data['short_name'] = short$name;
    return _data;
  }

  AddressComponent copyWith(
      {List<String>? types, String? long$name, String? short$name}) {
    return AddressComponent(
        types: types ?? this.types,
        long$name: long$name ?? this.long$name,
        short$name: short$name ?? this.short$name);
  }

  List<Object?> get props => [List.from(types ?? []), long$name, short$name];
}
