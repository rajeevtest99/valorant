import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'package:valorant/screens/weapons/weapons_Main_Page/weapons_main_model.dart';

class WeaponsApiCont {
  Future<Weapons> getWeapons() async {
    final weaponsdb = Hive.box("WEAPONS_API_CACHE").get("maps_main");
    if (weaponsdb != null) {
      final Weapons weapons = weaponsFromJson(weaponsdb);
      print("this is weaponsdb $weaponsdb");
      return weapons;
    }
    var response =
        await http.get(Uri.https("valorant-api.com", "/v1/weapons/"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Accept": "application/json",
    });
    print("this is Status code ${response.statusCode}");
    try {
      if (response.statusCode == 200) {
        final Weapons weapons = weaponsFromJson(response.body);
        Hive.box("WEAPONS_API_CACHE").put("maps_main", response.body);
        print(response.body);

        return weapons;
      } else {
        return Weapons();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
