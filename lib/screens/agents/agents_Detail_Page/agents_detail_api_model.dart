// To parse this JSON data, do
//
//     final valoAgentsDetailModel = valoAgentsDetailModelFromJson(jsonString);

import 'dart:convert';

ValoAgentsDetailModel valoAgentsDetailModelFromJson(String str) =>
    ValoAgentsDetailModel.fromJson(json.decode(str));

String valoAgentsDetailModelToJson(ValoAgentsDetailModel data) =>
    json.encode(data.toJson());

class ValoAgentsDetailModel {
  ValoAgentsDetailModel({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory ValoAgentsDetailModel.fromJson(Map<String, dynamic> json) =>
      ValoAgentsDetailModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.killfeedPortrait,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.role,
    this.abilities,
  });

  String? uuid;
  String? displayName;
  String? description;
  String? developerName;

  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? killfeedPortrait;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  Role? role;
  List<Ability>? abilities;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        developerName: json["developerName"],
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        killfeedPortrait: json["killfeedPortrait"],
        assetPath: json["assetPath"],
        isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
        isPlayableCharacter: json["isPlayableCharacter"],
        isAvailableForTest: json["isAvailableForTest"],
        role: Role.fromJson(json["role"]),
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "killfeedPortrait": killfeedPortrait,
        "assetPath": assetPath,
        "isFullPortraitRightFacing": isFullPortraitRightFacing,
        "isPlayableCharacter": isPlayableCharacter,
        "isAvailableForTest": isAvailableForTest,
        "role": role!.toJson(),
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
      };
}

class Ability {
  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json["slot"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
      };
}

class Role {
  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
      };
}
