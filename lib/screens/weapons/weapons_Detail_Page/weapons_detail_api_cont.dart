import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_details_page_models/details_skin.dart';

import 'weapons_details_page_models/detail_chroma.dart';

class WeaponsDetailedApiCont {
  dynamic error;
  Future<Map<String, dynamic>> getDetailedWeapon(String uuid) async {
    var response = await http
        .get(Uri.https("valorant-api.com", "/v1/weapons/$uuid/"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      var string = json.decode(response.body);

      return string;
    } else {
      return error;
    }
  }

  Future<DetailSkin> getDetailedWeaponSkin(String? skinId) async {
    var response = await http.get(
        Uri.https("valorant-api.com", "v1/weapons/skins/$skinId"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      final DetailSkin detailSkin = detailSkinFromJson(response.body);

      return detailSkin;
    } else {
      return DetailSkin();
    }
  }

  Future<DetailChroma> getDetailedWeaponChroma(String? skinId) async {
    var response = await http.get(
        Uri.https("valorant-api.com", "v1/weapons/skinchromas/$skinId"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      final DetailChroma detailChroma = detailChromaFromJson(response.body);

      return detailChroma;
    } else {
      return DetailChroma();
    }
  }
}
