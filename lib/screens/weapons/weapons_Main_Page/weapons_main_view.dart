import 'package:flutter/material.dart';

import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_detailed_view.dart';

import 'package:valorant/screens/weapons/weapons_Main_Page/weapons_main_api_cont.dart';
import 'package:valorant/screens/weapons/weapons_Main_Page/weapons_main_model.dart';
import 'package:valorant/widgets/common_loader.dart';

import 'widgets/display_card.dart';

class WeaponsView extends StatefulWidget {
  @override
  _WeaponsViewState createState() => _WeaponsViewState();
}

class _WeaponsViewState extends State<WeaponsView> {
  Future<Weapons>? weapons;

  @override
  void initState() {
    super.initState();
    weapons = WeaponsApiCont().getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: FutureBuilder<Weapons>(
            future: weapons,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      var weapons = snapshot.data!.data![index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WeaponsDetailedView(uuid: weapons.uuid)));
                        },
                        child: WeaponsMainDisplayCard(
                          imageurl: weapons.displayIcon,
                          name: weapons.displayName,
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("Error occured");
              } else {
                return CommonLoader();
              }
            }),
      ),
    );
  }
}
