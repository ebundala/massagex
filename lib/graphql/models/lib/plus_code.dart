import "package:equatable/equatable.dart";

class PlusCode extends Equatable {
  final String? global$code;
  final String? compound$$code;
  PlusCode({this.global$code, this.compound$$code});

  static PlusCode fromJson(Map<dynamic, dynamic> json) {
    return PlusCode(
      global$code: json['global_code'],
      compound$$code: json['compound__code'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (global$code != null) _data['global_code'] = global$code;
    if (compound$$code != null) _data['compound__code'] = compound$$code;
    return _data;
  }

  PlusCode copyWith({String? global$code, String? compound$$code}) {
    return PlusCode(
        global$code: global$code ?? this.global$code,
        compound$$code: compound$$code ?? this.compound$$code);
  }

  List<Object?> get props => [global$code, compound$$code];
}
