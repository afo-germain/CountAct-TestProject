import 'dart:convert';

Professions? professionsFromJson(String str) =>
    Professions.fromJson(json.decode(str));

String professionsToJson(Professions? data) => json.encode(data!.toJson());

class Professions {
  Professions({
    this.metiers,
  });

  List<String?>? metiers;

  factory Professions.fromJson(Map<String, dynamic> json) => Professions(
        metiers: json["metiers"] == null
            ? []
            : List<String?>.from(json["metiers"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "metiers":
            metiers == null ? [] : List<dynamic>.from(metiers!.map((x) => x)),
      };
}
