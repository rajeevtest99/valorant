// To parse this JSON data, do
//
//     final detailSkin = detailSkinFromJson(jsonString);

import 'dart:convert';

DetailSkin detailSkinFromJson(String str) =>
    DetailSkin.fromJson(json.decode(str));

String detailSkinToJson(DetailSkin data) => json.encode(data.toJson());

class DetailSkin {
  DetailSkin({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory DetailSkin.fromJson(Map<String, dynamic> json) => DetailSkin(
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
    this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.assetPath,
    this.chromas,
    this.levels,
  });

  String? uuid;
  String? displayName;
  String? themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  String? assetPath;
  List<Chroma>? chromas;
  List<Level>? levels;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        displayName: json["displayName"],
        themeUuid: json["themeUuid"],
        contentTierUuid: json["contentTierUuid"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
        chromas:
            List<Chroma>.from(json["chromas"].map((x) => Chroma.fromJson(x))),
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "themeUuid": themeUuid,
        "contentTierUuid": contentTierUuid,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
        "chromas": List<dynamic>.from(chromas!.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels!.map((x) => x.toJson())),
      };
}

class Chroma {
  Chroma({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.fullRender,
    this.swatch,
    this.streamedVideo,
    this.assetPath,
  });

  String? uuid;
  String? displayName;
  String? displayIcon;
  String? fullRender;
  String? swatch;
  String? streamedVideo;
  String? assetPath;

  factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        fullRender: json["fullRender"],
        swatch: json["swatch"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayIcon": displayIcon,
        "fullRender": fullRender,
        "swatch": swatch,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}

class Level {
  Level({
    this.uuid,
    this.displayName,
    this.levelItem,
    this.displayIcon,
    this.streamedVideo,
    this.assetPath,
  });

  String? uuid;
  String? displayName;
  String? levelItem;
  String? displayIcon;
  String? streamedVideo;
  String? assetPath;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        displayName: json["displayName"],
        levelItem: json["levelItem"] == null ? null : json["levelItem"],
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "levelItem": levelItem == null ? null : levelItem,
        "displayIcon": displayIcon == null ? null : displayIcon,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}
