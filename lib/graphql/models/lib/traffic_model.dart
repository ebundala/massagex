enum TrafficModel { best$guess, pessimistic, optimistic }

extension TrafficModelExt on TrafficModel {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TrafficModel.best$guess:
        return "best_guess";
      case TrafficModel.pessimistic:
        return "pessimistic";
      case TrafficModel.optimistic:
        return "optimistic";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TrafficModel fromJson(String json) {
    switch (json) {
      case "best_guess":
        return TrafficModel.best$guess;
      case "pessimistic":
        return TrafficModel.pessimistic;
      case "optimistic":
        return TrafficModel.optimistic;
      default:
        return TrafficModel.best$guess;
    }
    //return TrafficModel.values.firstWhere((e) => e.toJson() == json);
  }
}
