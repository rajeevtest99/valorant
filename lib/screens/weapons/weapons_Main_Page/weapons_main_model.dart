// To parse this JSON data, do
//
//     final weapons = weaponsFromJson(jsonString);

import 'dart:convert';

Weapons weaponsFromJson(String str) => Weapons.fromJson(json.decode(str));

String weaponsToJson(Weapons data) => json.encode(data.toJson());

class Weapons {
  Weapons({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory Weapons.fromJson(Map<String, dynamic> json) => Weapons(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.uuid,
    this.displayName,
    this.displayIcon,
  });

  String? uuid;
  String? displayName;

  String? displayIcon;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayIcon": displayIcon,
      };
}
