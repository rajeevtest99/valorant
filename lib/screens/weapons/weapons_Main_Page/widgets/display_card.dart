import 'package:flutter/material.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class WeaponsMainDisplayCard extends StatelessWidget {
  const WeaponsMainDisplayCard({Key? key, this.imageurl, this.name})
      : super(key: key);
  final String? imageurl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 2 * SizeConfig.heightMultiplier,
          vertical: 3 * SizeConfig.widthMultiplier),
      child: Column(
        children: [
          Container(
            width: 85 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 3),
                      color: AppTheme.rhino.withOpacity(0.8),
                      spreadRadius: 0.5,
                      blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://wallpaperaccess.com/download/valorant-logo-2576101"),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    AppTheme.black.withOpacity(0.9),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.center)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4 * SizeConfig.heightMultiplier,
                        vertical: 6 * SizeConfig.widthMultiplier),
                    child: Center(
                      child: imageurl == null
                          ? Container()
                          : Image.network(
                              imageurl!,
                              height: 10 * SizeConfig.heightMultiplier,
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4 * SizeConfig.heightMultiplier,
                        vertical: 2 * SizeConfig.widthMultiplier),
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 3.5 * SizeConfig.widthMultiplier),
                      child: Text(
                        name == null ? "no name" : name!,
                        style: TextStyle(
                            fontSize: 4 * SizeConfig.textMultiplier,
                            color: AppTheme.waterMelon),
                      ),
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
