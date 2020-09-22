import 'dart:convert';

import 'package:flutter_app_redux/models/coordinates.dart';
import 'package:flutter_app_redux/models/street.dart';
import 'package:flutter_app_redux/models/timezone.dart';

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  Street street;
  String city;
  String state;
  String country;
  String postcode;
  Coordinates coordinates;
  Timezone timezone;

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: Street.fromJson(json["street"]),
    city: json["city"],
    state: json["state"],
    country: json["country"],
    postcode: (json["postcode"]).toString(),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    timezone: Timezone.fromJson(json["timezone"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street.toJson(),
    "city": city,
    "state": state,
    "country": country,
    "postcode": postcode,
    "coordinates": coordinates.toJson(),
    "timezone": timezone.toJson(),
  };
}