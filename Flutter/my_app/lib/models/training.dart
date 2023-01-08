import 'dart:convert';

Training? trainingFromJson(String str) => Training.fromJson(json.decode(str));

String trainingToJson(Training? data) => json.encode(data!.toJson());

class Training {
  Training({
    this.results,
  });

  List<Result?>? results;

  factory Training.fromJson(Map<String, dynamic> json) => Training(
        results: json["results"] == null
            ? []
            : List<Result?>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x!.toJson())),
      };
}

class Result {
  Result({
    this.capacity,
    this.cfd,
    this.cleMinistereEducatif,
    this.company,
    this.contact,
    this.createdAt,
    this.diploma,
    this.diplomaLevel,
    this.id,
    this.idRco,
    this.idRcoFormation,
    this.ideaType,
    this.job,
    this.lastUpdateAt,
    this.longTitle,
    this.nafs,
    this.onisepUrl,
    this.period,
    this.place,
    this.rncpCode,
    this.rncpEligibleApprentissage,
    this.rncpLabel,
    this.romes,
    this.title,
    this.training,
    this.url,
  });

  dynamic capacity;
  String? cfd;
  String? cleMinistereEducatif;
  Company? company;
  dynamic contact;
  DateTime? createdAt;
  String? diploma;
  DiplomaLevel? diplomaLevel;
  String? id;
  String? idRco;
  String? idRcoFormation;
  IdeaType? ideaType;
  dynamic job;
  DateTime? lastUpdateAt;
  String? longTitle;
  dynamic nafs;
  dynamic onisepUrl;
  dynamic period;
  Map<String, String?>? place;
  String? rncpCode;
  bool? rncpEligibleApprentissage;
  String? rncpLabel;
  List<Rome?>? romes;
  String? title;
  dynamic training;
  dynamic url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        capacity: json["capacity"],
        cfd: json["cfd"],
        cleMinistereEducatif: json["cleMinistereEducatif"],
        company: Company.fromJson(json["company"]),
        contact: json["contact"],
        createdAt: DateTime.parse(json["createdAt"]),
        diploma: json["diploma"],
        diplomaLevel: diplomaLevelValues!.map[json["diplomaLevel"]],
        id: json["id"],
        idRco: json["idRco"],
        idRcoFormation: json["idRcoFormation"],
        ideaType: ideaTypeValues!.map[json["ideaType"]],
        job: json["job"],
        lastUpdateAt: DateTime.parse(json["lastUpdateAt"]),
        longTitle: json["longTitle"],
        nafs: json["nafs"],
        onisepUrl: json["onisepUrl"],
        period: json["period"],
        place: Map.from(json["place"]!)
            .map((k, v) => MapEntry<String, String?>(k, v)),
        rncpCode: json["rncpCode"],
        rncpEligibleApprentissage: json["rncpEligibleApprentissage"],
        rncpLabel: json["rncpLabel"],
        romes: json["romes"] == null
            ? []
            : List<Rome?>.from(json["romes"]!.map((x) => Rome.fromJson(x))),
        title: json["title"],
        training: json["training"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "capacity": capacity,
        "cfd": cfd,
        "cleMinistereEducatif": cleMinistereEducatif,
        "company": company!.toJson(),
        "contact": contact,
        "createdAt": createdAt?.toIso8601String(),
        "diploma": diploma,
        "diplomaLevel": diplomaLevelValues.reverse![diplomaLevel],
        "id": id,
        "idRco": idRco,
        "idRcoFormation": idRcoFormation,
        "ideaType": ideaTypeValues.reverse![ideaType],
        "job": job,
        "lastUpdateAt": lastUpdateAt?.toIso8601String(),
        "longTitle": longTitle,
        "nafs": nafs,
        "onisepUrl": onisepUrl,
        "period": period,
        "place":
            Map.from(place!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "rncpCode": rncpCode,
        "rncpEligibleApprentissage": rncpEligibleApprentissage,
        "rncpLabel": rncpLabel,
        "romes": romes == null
            ? []
            : List<dynamic>.from(romes!.map((x) => x!.toJson())),
        "title": title,
        "training": training,
        "url": url,
      };
}

class Company {
  Company({
    this.headquarter,
    this.id,
    this.name,
    this.place,
    this.siret,
    this.uai,
  });

  Headquarter? headquarter;
  String? id;
  String? name;
  CompanyPlace? place;
  String? siret;
  String? uai;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        headquarter: Headquarter.fromJson(json["headquarter"]),
        id: json["id"],
        name: json["name"],
        place: CompanyPlace.fromJson(json["place"]),
        siret: json["siret"],
        uai: json["uai"],
      );

  Map<String, dynamic> toJson() => {
        "headquarter": headquarter!.toJson(),
        "id": id,
        "name": name,
        "place": place!.toJson(),
        "siret": siret,
        "uai": uai,
      };
}

class Headquarter {
  Headquarter({
    this.hasConvention,
    this.id,
    this.name,
    this.place,
    this.siret,
    this.type,
    this.uai,
  });

  dynamic hasConvention;
  String? id;
  String? name;
  HeadquarterPlace? place;
  String? siret;
  dynamic type;
  String? uai;

  factory Headquarter.fromJson(Map<String, dynamic> json) => Headquarter(
        hasConvention: json["hasConvention"],
        id: json["id"],
        name: json["name"],
        place: HeadquarterPlace.fromJson(json["place"]),
        siret: json["siret"],
        type: json["type"],
        uai: json["uai"],
      );

  Map<String, dynamic> toJson() => {
        "hasConvention": hasConvention,
        "id": id,
        "name": name,
        "place": place!.toJson(),
        "siret": siret,
        "type": type,
        "uai": uai,
      };
}

class HeadquarterPlace {
  HeadquarterPlace({
    this.address,
    this.cedex,
    this.city,
    this.zipCode,
  });

  String? address;
  String? cedex;
  String? city;
  String? zipCode;

  factory HeadquarterPlace.fromJson(Map<String, dynamic> json) =>
      HeadquarterPlace(
        address: json["address"],
        cedex: json["cedex"],
        city: json["city"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "cedex": cedex,
        "city": city,
        "zipCode": zipCode,
      };
}

class CompanyPlace {
  CompanyPlace({
    this.city,
  });

  String? city;

  factory CompanyPlace.fromJson(Map<String, dynamic> json) => CompanyPlace(
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
      };
}

enum DiplomaLevel {
  THE_6_LICENCE_BUT,
  THE_7_MASTER_TITRE_INGNIEUR,
  THE_5_BTS_DEUST,
  THE_4_BAC
}

final diplomaLevelValues = EnumValues({
  "4 (BAC...)": DiplomaLevel.THE_4_BAC,
  "5 (BTS, DEUST...)": DiplomaLevel.THE_5_BTS_DEUST,
  "6 (Licence, BUT...)": DiplomaLevel.THE_6_LICENCE_BUT,
  "7 (Master, titre ingénieur...)": DiplomaLevel.THE_7_MASTER_TITRE_INGNIEUR
});

enum IdeaType { FORMATION }

final ideaTypeValues = EnumValues({"formation": IdeaType.FORMATION});

class Rome {
  Rome({
    this.code,
  });

  Code? code;

  factory Rome.fromJson(Map<String, dynamic> json) => Rome(
        code: codeValues!.map[json["code"]],
      );

  Map<String, dynamic> toJson() => {
        "code": codeValues.reverse![code],
      };
}

enum Code {
  M1806,
  M1805,
  M1802,
  M1810,
  M1801,
  H1208,
  H1206,
  K2402,
  E1104,
  M1803,
  E1205,
  E1306,
  M1804,
  H1102,
  M1402,
  M1206,
  G1201,
  M1403,
  E1101,
  I1401
}

final codeValues = EnumValues({
  "E1101": Code.E1101,
  "E1104": Code.E1104,
  "E1205": Code.E1205,
  "E1306": Code.E1306,
  "G1201": Code.G1201,
  "H1102": Code.H1102,
  "H1206": Code.H1206,
  "H1208": Code.H1208,
  "I1401": Code.I1401,
  "K2402": Code.K2402,
  "M1206": Code.M1206,
  "M1402": Code.M1402,
  "M1403": Code.M1403,
  "M1801": Code.M1801,
  "M1802": Code.M1802,
  "M1803": Code.M1803,
  "M1804": Code.M1804,
  "M1805": Code.M1805,
  "M1806": Code.M1806,
  "M1810": Code.M1810
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
