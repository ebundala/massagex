import "package:equatable/equatable.dart";

class BatchPayload extends Equatable {
  final int? count;
  BatchPayload({this.count});

  static BatchPayload fromJson(Map<dynamic, dynamic> json) {
    return BatchPayload(
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (count != null) _data['count'] = count;
    return _data;
  }

  BatchPayload copyWith({int? count}) {
    return BatchPayload(count: count ?? this.count);
  }

  List<Object?> get props => [count];
}
