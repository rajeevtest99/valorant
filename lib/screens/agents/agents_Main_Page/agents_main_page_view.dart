import 'dart:math';

import 'package:flutter/material.dart';

import 'package:valorant/screens/agents/agents_Detail_Page/agents_detail_view.dart';
import 'package:valorant/screens/agents/agents_Main_Page/agents_main_controller.dart';
import 'package:valorant/screens/agents/agents_Main_Page/agents_main_page_api_model.dart';
import 'package:valorant/screens/agents/agents_Main_Page/widgets/display_card.dart';

import 'package:valorant/utils/size_config.dart';
import 'package:valorant/widgets/common_loader.dart';

class Agents extends StatefulWidget {
  const Agents({Key? key}) : super(key: key);

  @override
  _AgentsState createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  Future<ValoAgentsMain>? valoAgentsMain;

  @override
  void initState() {
    super.initState();
    valoAgentsMain = ApiCont().valoGetAgents();
  }

  @override
  Widget build(BuildContext context) {
    //random background image list

    final List? bgimage = [
      "https://wallpapercave.com/wp/wp7282580.png",
      "https://wallpapercave.com/wp/wp6212343.jpg",
      "https://wallpapercave.com/wp/wp7282544.jpg"
    ];

    //random background image logic

    int min = 0;
    int max = bgimage!.length - 1;

    var rnd = Random();

    var r = min + rnd.nextInt(max - min);
    String? image = bgimage[r].toString();

    return SafeArea(
        child: FutureBuilder<ValoAgentsMain>(
      future: valoAgentsMain,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.data!.length - 1,
              padding: EdgeInsets.symmetric(
                  horizontal: 1 * SizeConfig.heightMultiplier,
                  vertical: 1 * SizeConfig.widthMultiplier),
              itemBuilder: (context, index) {
                var agents = snapshot.data!.data![index];
                // ignore: unused_local_variable
                var removeduplicate = snapshot.data!.data!.removeWhere(
                    (element) =>
                        element.uuid == "ded3520f-4264-bfed-162d-b080e2abccf9");

                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AgentsDetailView(agentuuid: agents.uuid))),
                  child: DisplayCard(
                    agents: agents,
                    bgimage: image,
                  ),
                );
              });
        } else {
          return CommonLoader();
        }
      },
    ));
  }
}
