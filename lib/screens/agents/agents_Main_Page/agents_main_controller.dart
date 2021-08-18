import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'package:valorant/screens/agents/agents_Main_Page/agents_main_page_api_model.dart';

class ApiCont {
  Future<ValoAgentsMain> valoGetAgents() async {
    final agents = Hive.box("AGENTS_API_CACHE").get("agents_main");
    if (agents != null) {
      ValoAgentsMain valoAgentsMain = valoAgentsMainFromJson(agents);
      return valoAgentsMain;
    }
    var response =
        await http.get(Uri.https("valorant-api.com", "/v1/agents"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Accept": "application/json",
    });
    print("this is Status code ${response.statusCode}");

    try {
      if (response.statusCode == 200) {
        final ValoAgentsMain valoAgentsMain =
            valoAgentsMainFromJson(response.body);

        Hive.box("AGENTS_API_CACHE").put("agents_main", response.body);
        print(valoAgentsMain);

        return valoAgentsMain;
      } else {
        return ValoAgentsMain();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
