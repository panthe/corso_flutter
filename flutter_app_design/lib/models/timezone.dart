import 'dart:convert';

class Timezone {
  Timezone({
    this.offset,
    this.description,
  });

  String offset;
  String description;

  factory Timezone.fromRawJson(String str) => Timezone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    offset: json["offset"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "description": description,
  };
}