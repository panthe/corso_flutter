import 'dart:convert';

import 'package:flutter_app_design/models/dob.dart';
import 'package:flutter_app_design/models/id.dart';
import 'package:flutter_app_design/models/location.dart';
import 'package:flutter_app_design/models/login.dart';
import 'package:flutter_app_design/models/name.dart';
import 'package:flutter_app_design/models/picture.dart';

class Result {
  Result({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    gender: json["gender"],
    name: Name.fromJson(json["name"]),
    location: Location.fromJson(json["location"]),
    email: json["email"],
    login: Login.fromJson(json["login"]),
    dob: Dob.fromJson(json["dob"]),
    registered: Dob.fromJson(json["registered"]),
    phone: json["phone"],
    cell: json["cell"],
    id: Id.fromJson(json["id"]),
    picture: Picture.fromJson(json["picture"]),
    nat: json["nat"],
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "name": name.toJson(),
    "location": location.toJson(),
    "email": email,
    "login": login.toJson(),
    "dob": dob.toJson(),
    "registered": registered.toJson(),
    "phone": phone,
    "cell": cell,
    "id": id.toJson(),
    "picture": picture.toJson(),
    "nat": nat,
  };
}