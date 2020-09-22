import 'dart:convert';

class User {
  User({
    this.title,
    this.first,
    this.last,
  });

  String title;
  String first;
  String last;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    title: json["title"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "first": first,
    "last": last,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          first == other.first &&
          last == other.last;

  @override
  int get hashCode => title.hashCode ^ first.hashCode ^ last.hashCode;
}