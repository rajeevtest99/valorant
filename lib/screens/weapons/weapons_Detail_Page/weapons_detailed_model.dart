// To parse this JSON data, do
//
//     final weaponsDetail = weaponsDetailFromJson(jsonString);

import 'dart:convert';

WeaponsDetail weaponsDetailFromJson(String str) =>
    WeaponsDetail.fromJson(json.decode(str));

String weaponsDetailToJson(WeaponsDetail data) => json.encode(data.toJson());

class WeaponsDetail {
  WeaponsDetail({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory WeaponsDetail.fromJson(Map<String, dynamic> json) => WeaponsDetail(
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
    this.category,
    this.defaultSkinUuid,
    this.displayIcon,
    this.killStreamIcon,
    this.assetPath,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  String? uuid;
  String? displayName;
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skin>? skins;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        displayName: json["displayName"],
        category: json["category"],
        defaultSkinUuid: json["defaultSkinUuid"],
        displayIcon: json["displayIcon"],
        killStreamIcon: json["killStreamIcon"],
        assetPath: json["assetPath"],
        weaponStats: WeaponStats.fromJson(json["weaponStats"]!),
        shopData: ShopData.fromJson(json["shopData"]),
        skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "category": category,
        "defaultSkinUuid": defaultSkinUuid,
        "displayIcon": displayIcon,
        "killStreamIcon": killStreamIcon,
        "assetPath": assetPath,
        "weaponStats": weaponStats!.toJson(),
        "shopData": shopData!.toJson(),
        "skins": List<dynamic>.from(skins!.map((x) => x.toJson())),
      };
}

class ShopData {
  ShopData({
    this.cost,
    this.category,
    this.categoryText,
    this.canBeTrashed,
    this.image,
    this.newImage,
    this.newImage2,
    this.assetPath,
  });

  int? cost;
  String? category;
  String? categoryText;

  bool? canBeTrashed;
  dynamic image;
  String? newImage;
  dynamic newImage2;
  String? assetPath;

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json["cost"],
        category: json["category"],
        categoryText: json["categoryText"],
        canBeTrashed: json["canBeTrashed"],
        image: json["image"],
        newImage: json["newImage"],
        newImage2: json["newImage2"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "category": category,
        "categoryText": categoryText,
        "canBeTrashed": canBeTrashed,
        "image": image,
        "newImage": newImage,
        "newImage2": newImage2,
        "assetPath": assetPath,
      };
}

class GridPosition {
  GridPosition({
    this.row,
    this.column,
  });

  int? row;
  int? column;

  factory GridPosition.fromJson(Map<String, dynamic> json) => GridPosition(
        row: json["row"],
        column: json["column"],
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "column": column,
      };
}

class Skin {
  Skin({
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

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        uuid: json["uuid"],
        displayName: json["displayName"],
        themeUuid: json["themeUuid"],
        contentTierUuid:
            json["contentTierUuid"] == null ? null : json["contentTierUuid"],
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
        "contentTierUuid": contentTierUuid == null ? null : contentTierUuid,
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
  dynamic streamedVideo;
  String? assetPath;

  factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        fullRender: json["fullRender"],
        swatch: json["swatch"] == null ? null : json["swatch"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayIcon": displayIcon,
        "fullRender": fullRender,
        "swatch": swatch == null ? null : swatch,
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
        streamedVideo:
            json["streamedVideo"] == null ? null : json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "levelItem": levelItem == null ? null : levelItem,
        "displayIcon": displayIcon == null ? null : displayIcon,
        "streamedVideo": streamedVideo == null ? null : streamedVideo,
        "assetPath": assetPath,
      };
}

class WeaponStats {
  WeaponStats({
    this.magazineSize,
    this.runSpeedMultiplier,
    this.equipTimeSeconds,
    this.reloadTimeSeconds,
    this.firstBulletAccuracy,
    this.shotgunPelletCount,
    this.wallPenetration,
    this.feature,
    this.fireMode,
    this.altFireType,
    this.altShotgunStats,
    this.airBurstStats,
    this.damageRanges,
  });

  int? magazineSize;
  double? runSpeedMultiplier;
  double? equipTimeSeconds;
  dynamic reloadTimeSeconds;
  double? firstBulletAccuracy;
  int? shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  dynamic fireMode;
  String? altFireType;

  dynamic altShotgunStats;
  dynamic airBurstStats;
  List<DamageRange>? damageRanges;

  factory WeaponStats.fromJson(Map<String?, dynamic> json) => WeaponStats(
        magazineSize: json["magazineSize"],
        runSpeedMultiplier: json["runSpeedMultiplier"].toDouble(),
        equipTimeSeconds: json["equipTimeSeconds"].toDouble(),
        reloadTimeSeconds: json["reloadTimeSeconds"] ?? 0,
        firstBulletAccuracy: json["firstBulletAccuracy"].toDouble(),
        shotgunPelletCount: json["shotgunPelletCount"],
        wallPenetration: json["wallPenetration"],
        feature: json["feature"],
        fireMode: json["fireMode"],
        altFireType: json["altFireType"],
        altShotgunStats: json["altShotgunStats"],
        airBurstStats: json["airBurstStats"],
        damageRanges: List<DamageRange>.from(
            json["damageRanges"].map((x) => DamageRange.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "magazineSize": magazineSize,
        "runSpeedMultiplier": runSpeedMultiplier,
        "equipTimeSeconds": equipTimeSeconds,
        "reloadTimeSeconds": reloadTimeSeconds,
        "firstBulletAccuracy": firstBulletAccuracy,
        "shotgunPelletCount": shotgunPelletCount,
        "wallPenetration": wallPenetration,
        "feature": feature,
        "fireMode": fireMode,
        "altFireType": altFireType,
        "altShotgunStats": altShotgunStats,
        "airBurstStats": airBurstStats,
        "damageRanges":
            List<dynamic>.from(damageRanges!.map((x) => x.toJson())),
      };
}

class AdsStats {
  AdsStats({
    this.zoomMultiplier,
    this.fireRate,
    this.runSpeedMultiplier,
    this.burstCount,
    this.firstBulletAccuracy,
  });

  double? zoomMultiplier;
  double? fireRate;
  double? runSpeedMultiplier;
  int? burstCount;
  double? firstBulletAccuracy;

  factory AdsStats.fromJson(Map<String, dynamic> json) => AdsStats(
        zoomMultiplier: json["zoomMultiplier"].toDouble(),
        fireRate: json["fireRate"].toDouble(),
        runSpeedMultiplier: json["runSpeedMultiplier"].toDouble(),
        burstCount: json["burstCount"],
        firstBulletAccuracy: json["firstBulletAccuracy"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "zoomMultiplier": zoomMultiplier,
        "fireRate": fireRate,
        "runSpeedMultiplier": runSpeedMultiplier,
        "burstCount": burstCount,
        "firstBulletAccuracy": firstBulletAccuracy,
      };
}

class DamageRange {
  DamageRange({
    this.rangeStartMeters,
    this.rangeEndMeters,
    this.headDamage,
    this.bodyDamage,
    this.legDamage,
  });

  int? rangeStartMeters;
  int? rangeEndMeters;
  double? headDamage;
  int? bodyDamage;
  double? legDamage;

  factory DamageRange.fromJson(Map<String, dynamic> json) => DamageRange(
        rangeStartMeters: json["rangeStartMeters"],
        rangeEndMeters: json["rangeEndMeters"],
        headDamage: json["headDamage"].toDouble(),
        bodyDamage: json["bodyDamage"],
        legDamage: json["legDamage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "rangeStartMeters": rangeStartMeters,
        "rangeEndMeters": rangeEndMeters,
        "headDamage": headDamage,
        "bodyDamage": bodyDamage,
        "legDamage": legDamage,
      };
}
