import 'package:flutter/material.dart';
import 'package:valorant/screens/agents/agents_Main_Page/agents_main_page_api_model.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class DisplayCard extends StatelessWidget {
  DisplayCard({Key? key, required this.agents, this.bgimage}) : super(key: key);

  final Datum agents;
  final String? bgimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 2 * SizeConfig.heightMultiplier,
          vertical: 2 * SizeConfig.widthMultiplier),
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  color: AppTheme.burnham.withOpacity(0.3),
                  offset: Offset(2.5, 2.0),
                  blurRadius: 5,
                  spreadRadius: 2.5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0 * SizeConfig.heightMultiplier,
                  vertical: 0 * SizeConfig.widthMultiplier),
              child: Container(
                  // padding:
                  //     EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      image: DecorationImage(
                          image: NetworkImage(bgimage!), fit: BoxFit.cover)),
                  child: Image.network(
                    agents.fullPortrait!,
                    fit: BoxFit.cover,
                  )),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.5 * SizeConfig.heightMultiplier,
                      vertical: 3.5 * SizeConfig.widthMultiplier),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        agents.displayName!,
                        style: TextStyle(
                            fontFamily: "Coolvetica",
                            fontSize: 6 * SizeConfig.textMultiplier,
                            color: AppTheme.burnham),
                      ),
                      Image.network(
                        agents.role!.displayIcon!,
                        color: AppTheme.burnham,
                        height: 3 * SizeConfig.heightMultiplier,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.5 * SizeConfig.heightMultiplier,
                      vertical: 3.5 * SizeConfig.widthMultiplier),
                  child: Text(
                    agents.description!,
                    style: TextStyle(
                      fontSize: 2 * SizeConfig.textMultiplier,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
