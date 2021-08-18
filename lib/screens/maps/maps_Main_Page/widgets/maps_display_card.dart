import 'package:flutter/material.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class MapsDisplayCard extends StatelessWidget {
  const MapsDisplayCard({Key? key, this.name, this.imageurl, this.coordinates})
      : super(key: key);
  final String? name;
  final String? imageurl;
  final String? coordinates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.heightMultiplier,
          vertical: 6 * SizeConfig.widthMultiplier),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 65 * SizeConfig.heightMultiplier,
              width: 85 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 3),
                      color: AppTheme.rhino.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    imageurl!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            AppTheme.burnham.withOpacity(0.9),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2 * SizeConfig.heightMultiplier,
                        vertical: 4 * SizeConfig.widthMultiplier),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2 * SizeConfig.widthMultiplier),
                          child: Text(
                            name!,
                            style: TextStyle(
                                fontSize: 4 * SizeConfig.textMultiplier,
                                color: AppTheme.white),
                          ),
                        ),
                        coordinates == null
                            ? Container()
                            : Text(
                                coordinates!,
                                style: TextStyle(
                                    letterSpacing:
                                        1.5 * SizeConfig.widthMultiplier,
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    color: AppTheme.brandyRose),
                              )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
