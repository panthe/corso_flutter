import 'dart:convert';

class Street {
  Street({
    this.number,
    this.name,
  });

  int number;
  String name;

  factory Street.fromRawJson(String str) => Street.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Street.fromJson(Map<String, dynamic> json) => Street(
    number: json["number"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
  };
}