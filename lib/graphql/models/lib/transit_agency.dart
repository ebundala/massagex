import "package:equatable/equatable.dart";

class TransitAgency extends Equatable {
  final String? name;
  final String? phone;
  final String? url;
  TransitAgency({this.name, this.phone, this.url});

  static TransitAgency fromJson(Map<dynamic, dynamic> json) {
    return TransitAgency(
      name: json['name'],
      phone: json['phone'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (name != null) _data['name'] = name;
    if (phone != null) _data['phone'] = phone;
    if (url != null) _data['url'] = url;
    return _data;
  }

  TransitAgency copyWith({String? name, String? phone, String? url}) {
    return TransitAgency(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        url: url ?? this.url);
  }

  List<Object?> get props => [name, phone, url];
}
