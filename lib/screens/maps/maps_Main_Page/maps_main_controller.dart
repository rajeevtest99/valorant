import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'package:valorant/screens/maps/maps_Main_Page/maps_main_api_model.dart';

class MapsApiCont {
  dynamic error;
  Future<MapsModel> getMaps() async {
    final maps = Hive.box("MAPS_API_CACHE").get("maps_main");
    if (maps != null) {
      final MapsModel mapsModel = mapsModelFromJson(maps);
      return mapsModel;
    }
    var response =
        await http.get(Uri.https("valorant-api.com", "/v1/maps"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Accept": "application/json",
    });
    print("this is Status code ${response.statusCode}");
    try {
      if (response.statusCode == 200) {
        final MapsModel mapsModel = mapsModelFromJson(response.body);
        Hive.box("MAPS_API_CACHE").put("maps_main", response.body);

        print(response.body);

        return mapsModel;
      } else {
        return MapsModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
