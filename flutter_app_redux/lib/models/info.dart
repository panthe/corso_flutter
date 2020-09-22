import 'dart:convert';

class Info {
  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  String seed;
  int results;
  int page;
  String version;

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    seed: json["seed"],
    results: json["results"],
    page: json["page"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "seed": seed,
    "results": results,
    "page": page,
    "version": version,
  };
}