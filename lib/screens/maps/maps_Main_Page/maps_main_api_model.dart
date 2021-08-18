// To parse this JSON data, do
//
//     final mapsModel = mapsModelFromJson(jsonString);

import 'dart:convert';

MapsModel mapsModelFromJson(String str) => MapsModel.fromJson(json.decode(str));

String mapsModelToJson(MapsModel data) => json.encode(data.toJson());

class MapsModel {
  MapsModel({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory MapsModel.fromJson(Map<String, dynamic> json) => MapsModel(
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
    this.coordinates,
    this.splash,
  });

  String? uuid;
  String? displayName;
  String? coordinates;

  String? splash;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        coordinates: json["coordinates"] == null ? null : json["coordinates"],
        splash: json["splash"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "coordinates": coordinates == null ? null : coordinates,
        "splash": splash,
      };
}
