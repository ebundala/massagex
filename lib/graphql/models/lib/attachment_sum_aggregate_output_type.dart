import "package:equatable/equatable.dart";

class AttachmentSumAggregateOutputType extends Equatable {
  final int? duration;
  final int? size;
  AttachmentSumAggregateOutputType({this.duration, this.size});

  static AttachmentSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return AttachmentSumAggregateOutputType(
      duration: json['duration'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (duration != null) _data['duration'] = duration;
    if (size != null) _data['size'] = size;
    return _data;
  }

  AttachmentSumAggregateOutputType copyWith({int? duration, int? size}) {
    return AttachmentSumAggregateOutputType(
        duration: duration ?? this.duration, size: size ?? this.size);
  }

  List<Object?> get props => [duration, size];
}
