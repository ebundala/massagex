import 'prediction_substring.dart';

import "package:equatable/equatable.dart";

class StructuredFormatting extends Equatable {
  final String? main$text;
  final List<PredictionSubstring>? main$text$matched$substrings;
  final String? secondary$text;
  StructuredFormatting(
      {this.main$text, this.main$text$matched$substrings, this.secondary$text});

  static StructuredFormatting fromJson(Map<dynamic, dynamic> json) {
    return StructuredFormatting(
      main$text: json['main_text'],
      main$text$matched$substrings: json['main_text_matched_substrings'] != null
          ? List.generate(
              json['main_text_matched_substrings'].length,
              (index) => PredictionSubstring.fromJson(
                  json['main_text_matched_substrings'][index]))
          : null,
      secondary$text: json['secondary_text'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (main$text != null) _data['main_text'] = main$text;
    if (main$text$matched$substrings != null)
      _data['main_text_matched_substrings'] = List.generate(
          main$text$matched$substrings?.length ?? 0,
          (index) => main$text$matched$substrings![index].toJson());
    if (secondary$text != null) _data['secondary_text'] = secondary$text;
    return _data;
  }

  StructuredFormatting copyWith(
      {String? main$text,
      List<PredictionSubstring>? main$text$matched$substrings,
      String? secondary$text}) {
    return StructuredFormatting(
        main$text: main$text ?? this.main$text,
        main$text$matched$substrings:
            main$text$matched$substrings ?? this.main$text$matched$substrings,
        secondary$text: secondary$text ?? this.secondary$text);
  }

  List<Object?> get props => [
        main$text,
        List.from(main$text$matched$substrings ?? []),
        secondary$text
      ];
}
