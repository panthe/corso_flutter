import 'dart:convert';

class Dob {
  Dob({
    this.date,
    this.age,
  });

  DateTime date;
  int age;

  factory Dob.fromRawJson(String str) => Dob.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    date: DateTime.parse(json["date"]),
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "age": age,
  };
}