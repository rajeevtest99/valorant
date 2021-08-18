// To parse this JSON data, do
//
//     final detailChroma = detailChromaFromJson(jsonString);

import 'dart:convert';

DetailChroma detailChromaFromJson(String str) =>
    DetailChroma.fromJson(json.decode(str));

String detailChromaToJson(DetailChroma data) => json.encode(data.toJson());

class DetailChroma {
  DetailChroma({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory DetailChroma.fromJson(Map<String, dynamic> json) => DetailChroma(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
