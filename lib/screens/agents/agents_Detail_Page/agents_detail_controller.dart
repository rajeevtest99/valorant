import 'package:http/http.dart' as http;
import 'package:valorant/screens/agents/agents_Detail_Page/agents_detail_api_model.dart';

class ValoAgentDetailedApiCont {
  Future<ValoAgentsDetailModel> valoGetAgents(String uuid) async {
    var response = await http
        .get(Uri.https("valorant-api.com", "/v1/agents/$uuid"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Accept": "application/json",
    });

    try {
      if (response.statusCode == 200) {
        final ValoAgentsDetailModel valoAgentsDetailed =
            valoAgentsDetailModelFromJson(response.body);
        print(response.body);
        return valoAgentsDetailed;
      } else {
        return ValoAgentsDetailModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
