import 'dart:convert';

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String latitude;
  String longitude;

  factory Coordinates.fromRawJson(String str) => Coordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}