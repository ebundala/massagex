enum Maneuver {
  turn$slight$left,
  turn$sharp$left,
  uturn$left,
  turn$left,
  turn$slight$right,
  turn$sharp$right,
  uturn$right,
  turn$right,
  straight,
  ramp$left,
  ramp$right,
  merge,
  fork$left,
  fork$right,
  ferry,
  ferry$train,
  roundabout$left,
  roundabout$right
}

extension ManeuverExt on Maneuver {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case Maneuver.turn$slight$left:
        return "turn_slight_left";
      case Maneuver.turn$sharp$left:
        return "turn_sharp_left";
      case Maneuver.uturn$left:
        return "uturn_left";
      case Maneuver.turn$left:
        return "turn_left";
      case Maneuver.turn$slight$right:
        return "turn_slight_right";
      case Maneuver.turn$sharp$right:
        return "turn_sharp_right";
      case Maneuver.uturn$right:
        return "uturn_right";
      case Maneuver.turn$right:
        return "turn_right";
      case Maneuver.straight:
        return "straight";
      case Maneuver.ramp$left:
        return "ramp_left";
      case Maneuver.ramp$right:
        return "ramp_right";
      case Maneuver.merge:
        return "merge";
      case Maneuver.fork$left:
        return "fork_left";
      case Maneuver.fork$right:
        return "fork_right";
      case Maneuver.ferry:
        return "ferry";
      case Maneuver.ferry$train:
        return "ferry_train";
      case Maneuver.roundabout$left:
        return "roundabout_left";
      case Maneuver.roundabout$right:
        return "roundabout_right";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static Maneuver fromJson(String json) {
    switch (json) {
      case "turn_slight_left":
        return Maneuver.turn$slight$left;
      case "turn_sharp_left":
        return Maneuver.turn$sharp$left;
      case "uturn_left":
        return Maneuver.uturn$left;
      case "turn_left":
        return Maneuver.turn$left;
      case "turn_slight_right":
        return Maneuver.turn$slight$right;
      case "turn_sharp_right":
        return Maneuver.turn$sharp$right;
      case "uturn_right":
        return Maneuver.uturn$right;
      case "turn_right":
        return Maneuver.turn$right;
      case "straight":
        return Maneuver.straight;
      case "ramp_left":
        return Maneuver.ramp$left;
      case "ramp_right":
        return Maneuver.ramp$right;
      case "merge":
        return Maneuver.merge;
      case "fork_left":
        return Maneuver.fork$left;
      case "fork_right":
        return Maneuver.fork$right;
      case "ferry":
        return Maneuver.ferry;
      case "ferry_train":
        return Maneuver.ferry$train;
      case "roundabout_left":
        return Maneuver.roundabout$left;
      case "roundabout_right":
        return Maneuver.roundabout$right;
      default:
        return Maneuver.turn$slight$left;
    }
    //return Maneuver.values.firstWhere((e) => e.toJson() == json);
  }
}
