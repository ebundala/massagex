enum AddressType {
  street$address,
  route,
  intersection,
  political,
  country,
  administrative$area$level$1,
  administrative$area$level$2,
  administrative$area$level$3,
  administrative$area$level$4,
  administrative$area$level$5,
  colloquial$area,
  locality,
  ward,
  sublocality,
  sublocality$level$1,
  sublocality$level$2,
  sublocality$level$3,
  sublocality$level$4,
  sublocality$level$5,
  neighborhood,
  premise,
  subpremise,
  postal$code,
  natural$feature,
  airport,
  park,
  point$of$interest,
  establishment,
  floor,
  post$box,
  postal$town,
  room,
  street$number,
  bus$station,
  train$station,
  transit$station,
  food,
  store,
  lodging,
  church,
  place$of$worship,
  plus$code
}

extension AddressTypeExt on AddressType {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AddressType.street$address:
        return "street_address";
      case AddressType.route:
        return "route";
      case AddressType.intersection:
        return "intersection";
      case AddressType.political:
        return "political";
      case AddressType.country:
        return "country";
      case AddressType.administrative$area$level$1:
        return "administrative_area_level_1";
      case AddressType.administrative$area$level$2:
        return "administrative_area_level_2";
      case AddressType.administrative$area$level$3:
        return "administrative_area_level_3";
      case AddressType.administrative$area$level$4:
        return "administrative_area_level_4";
      case AddressType.administrative$area$level$5:
        return "administrative_area_level_5";
      case AddressType.colloquial$area:
        return "colloquial_area";
      case AddressType.locality:
        return "locality";
      case AddressType.ward:
        return "ward";
      case AddressType.sublocality:
        return "sublocality";
      case AddressType.sublocality$level$1:
        return "sublocality_level_1";
      case AddressType.sublocality$level$2:
        return "sublocality_level_2";
      case AddressType.sublocality$level$3:
        return "sublocality_level_3";
      case AddressType.sublocality$level$4:
        return "sublocality_level_4";
      case AddressType.sublocality$level$5:
        return "sublocality_level_5";
      case AddressType.neighborhood:
        return "neighborhood";
      case AddressType.premise:
        return "premise";
      case AddressType.subpremise:
        return "subpremise";
      case AddressType.postal$code:
        return "postal_code";
      case AddressType.natural$feature:
        return "natural_feature";
      case AddressType.airport:
        return "airport";
      case AddressType.park:
        return "park";
      case AddressType.point$of$interest:
        return "point_of_interest";
      case AddressType.establishment:
        return "establishment";
      case AddressType.floor:
        return "floor";
      case AddressType.post$box:
        return "post_box";
      case AddressType.postal$town:
        return "postal_town";
      case AddressType.room:
        return "room";
      case AddressType.street$number:
        return "street_number";
      case AddressType.bus$station:
        return "bus_station";
      case AddressType.train$station:
        return "train_station";
      case AddressType.transit$station:
        return "transit_station";
      case AddressType.food:
        return "food";
      case AddressType.store:
        return "store";
      case AddressType.lodging:
        return "lodging";
      case AddressType.church:
        return "church";
      case AddressType.place$of$worship:
        return "place_of_worship";
      case AddressType.plus$code:
        return "plus_code";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AddressType fromJson(String json) {
    switch (json) {
      case "street_address":
        return AddressType.street$address;
      case "route":
        return AddressType.route;
      case "intersection":
        return AddressType.intersection;
      case "political":
        return AddressType.political;
      case "country":
        return AddressType.country;
      case "administrative_area_level_1":
        return AddressType.administrative$area$level$1;
      case "administrative_area_level_2":
        return AddressType.administrative$area$level$2;
      case "administrative_area_level_3":
        return AddressType.administrative$area$level$3;
      case "administrative_area_level_4":
        return AddressType.administrative$area$level$4;
      case "administrative_area_level_5":
        return AddressType.administrative$area$level$5;
      case "colloquial_area":
        return AddressType.colloquial$area;
      case "locality":
        return AddressType.locality;
      case "ward":
        return AddressType.ward;
      case "sublocality":
        return AddressType.sublocality;
      case "sublocality_level_1":
        return AddressType.sublocality$level$1;
      case "sublocality_level_2":
        return AddressType.sublocality$level$2;
      case "sublocality_level_3":
        return AddressType.sublocality$level$3;
      case "sublocality_level_4":
        return AddressType.sublocality$level$4;
      case "sublocality_level_5":
        return AddressType.sublocality$level$5;
      case "neighborhood":
        return AddressType.neighborhood;
      case "premise":
        return AddressType.premise;
      case "subpremise":
        return AddressType.subpremise;
      case "postal_code":
        return AddressType.postal$code;
      case "natural_feature":
        return AddressType.natural$feature;
      case "airport":
        return AddressType.airport;
      case "park":
        return AddressType.park;
      case "point_of_interest":
        return AddressType.point$of$interest;
      case "establishment":
        return AddressType.establishment;
      case "floor":
        return AddressType.floor;
      case "post_box":
        return AddressType.post$box;
      case "postal_town":
        return AddressType.postal$town;
      case "room":
        return AddressType.room;
      case "street_number":
        return AddressType.street$number;
      case "bus_station":
        return AddressType.bus$station;
      case "train_station":
        return AddressType.train$station;
      case "transit_station":
        return AddressType.transit$station;
      case "food":
        return AddressType.food;
      case "store":
        return AddressType.store;
      case "lodging":
        return AddressType.lodging;
      case "church":
        return AddressType.church;
      case "place_of_worship":
        return AddressType.place$of$worship;
      case "plus_code":
        return AddressType.plus$code;
      default:
        return AddressType.street$address;
    }
    //return AddressType.values.firstWhere((e) => e.toJson() == json);
  }
}
