import "package:equatable/equatable.dart";

class AttachmentAvgAggregateOutputType extends Equatable {
  final double? duration;
  final double? size;
  AttachmentAvgAggregateOutputType({this.duration, this.size});

  static AttachmentAvgAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return AttachmentAvgAggregateOutputType(
      duration: json['duration']?.toDouble(),
      size: json['size']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (duration != null) _data['duration'] = duration;
    if (size != null) _data['size'] = size;
    return _data;
  }

  AttachmentAvgAggregateOutputType copyWith({double? duration, double? size}) {
    return AttachmentAvgAggregateOutputType(
        duration: duration ?? this.duration, size: size ?? this.size);
  }

  List<Object?> get props => [duration, size];
}
