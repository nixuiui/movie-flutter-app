import 'dart:convert';

import 'package:flutter/material.dart';

RouteDirection routeDirectionFromMap(String str) => RouteDirection.fromMap(json.decode(str));

String routeDirectionToMap(RouteDirection data) => json.encode(data.toMap());

class RouteDirection {
  RouteDirection({
    this.bounds,
    this.copyrights,
    this.legs,
    this.overviewPolyline,
    this.summary,
  });

  Bounds? bounds;
  String? copyrights;
  List<Leg>? legs;
  Polyline? overviewPolyline;
  String? summary;

  factory RouteDirection.fromMap(Map<String, dynamic> json) => RouteDirection(
    bounds: json['bounds'] != null
        ? Bounds.fromMap(json['bounds'])
        : null,
    copyrights: json['copyrights'],
    legs: List<Leg>.from((json['legs'] ?? [])?.map((x) => Leg.fromMap(x))),
    overviewPolyline: json['overview_polyline'] != null 
        ? Polyline.fromMap(json['overview_polyline'])
        : null,
    summary: json['summary'],
  );

  Map<String, dynamic> toMap() => {
    'bounds': bounds?.toMap(),
    'copyrights': copyrights,
    'legs': List<dynamic>.from((legs ?? []).map((x) => x.toMap())),
    'overview_polyline': overviewPolyline?.toMap(),
    'summary': summary,
  };
}

class Bounds {
  Bounds({
    this.northeast,
    this.southwest,
  });

  Northeast? northeast;
  Northeast? southwest;

  factory Bounds.fromMap(Map<String, dynamic> json) => Bounds(
    northeast: json['northeast'] != null 
        ? Northeast.fromMap(json['northeast'])
        : null,
    southwest: json['southwest'] != null 
        ? Northeast.fromMap(json['southwest'])
        : null,
  );

  Map<String, dynamic> toMap() => {
    'northeast': northeast?.toMap(),
    'southwest': southwest?.toMap(),
  };
}

class Northeast {
  Northeast({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Northeast.fromMap(Map<String, dynamic> json) => Northeast(
    lat: json['lat'],
    lng: json['lng'],
  );

  Map<String, dynamic> toMap() => {
    'lat': lat,
    'lng': lng,
  };
}

class Leg {
  Leg({
    this.distance,
    this.duration,
    this.endAddress,
    this.endLocation,
    this.startAddress,
    this.startLocation,
    this.steps,
  });

  Distance? distance;
  Distance? duration;
  String? endAddress;
  Northeast? endLocation;
  String? startAddress;
  Northeast? startLocation;
  List<Step>? steps;

  factory Leg.fromMap(Map<String, dynamic> json) => Leg(
    distance: json['distance'] != null 
        ? Distance.fromMap(json['distance'])
        : null,
    duration: json['duration'] != null 
        ? Distance.fromMap(json['duration'])
        : null,
    endAddress: json['end_address'],
    endLocation: json['end_location'] != null 
        ? Northeast.fromMap(json['end_location'])
        : null,
    startAddress: json['start_address'],
    startLocation: json['start_location'] != null 
        ? Northeast.fromMap(json['start_location'])
        : null,
    steps: List<Step>.from((json['steps'] ?? []).map((x) => Step.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    'distance': distance?.toMap(),
    'duration': duration?.toMap(),
    'end_address': endAddress,
    'end_location': endLocation?.toMap(),
    'start_address': startAddress,
    'start_location': startLocation?.toMap(),
    'steps': List<dynamic>.from((steps ?? []).map((x) => x.toMap())),
  };

  double speed() {
    return (distance?.value ?? 0) > 0
        ? (((distance?.value ?? 0) / 1000) / ((duration?.value ?? 0) / 3600))
        : 1;
  }

  Color trafficColor() {
    final speed = this.speed();
    if (speed > 40) {
      return Colors.green;
    } else if (speed > 25 && speed <= 40) {
      return Colors.orange;
    }
    return Colors.red;
  }
}

class Distance {
  Distance({
    this.text,
    this.value,
  });

  String? text;
  int? value;

  factory Distance.fromMap(Map<String, dynamic> json) => Distance(
    text: json['text'],
    value: json['value'],
  );

  Map<String, dynamic> toMap() => {
    'text': text,
    'value': value,
  };
}

class Step {
  Step({
    this.distance,
    this.duration,
    this.endLocation,
    this.polyline,
    this.startLocation,
    this.htmlInstructions,
    this.travelMode,
    this.maneuver,
  });

  Distance? distance;
  Distance? duration;
  Northeast? endLocation;
  Polyline? polyline;
  Northeast? startLocation;
  String? htmlInstructions;
  String? travelMode;
  String? maneuver;

  factory Step.fromMap(Map<String, dynamic> json) => Step(
    distance: json['distance'] != null 
        ? Distance.fromMap(json['distance'])
        : null,
    duration: json['duration'] != null 
        ? Distance.fromMap(json['duration'])
        : null,
    endLocation: json['end_location'] != null 
        ? Northeast.fromMap(json['end_location'])
        : null,
    polyline: json['polyline'] != null 
        ? Polyline.fromMap(json['polyline'])
        : null,
    startLocation: json['start_location'] != null 
        ? Northeast.fromMap(json['start_location'])
        : null,
    htmlInstructions: json['html_instructions'],
    travelMode: json['travel_mode'],
    maneuver: json['maneuver'],
  );

  Map<String, dynamic> toMap() => {
    'distance': distance?.toMap(),
    'duration': duration?.toMap(),
    'end_location': endLocation?.toMap(),
    'polyline': polyline?.toMap(),
    'start_location': startLocation?.toMap(),
    'html_instructions': htmlInstructions,
    'travel_mode': travelMode,
    'maneuver': maneuver,
  };
}

class Polyline {
  Polyline({
    this.points,
  });

  String? points;

  factory Polyline.fromMap(Map<String, dynamic> json) => Polyline(
    points: json['points'],
  );

  Map<String, dynamic> toMap() => {
    'points': points,
  };
}
