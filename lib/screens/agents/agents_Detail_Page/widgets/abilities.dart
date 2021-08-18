import 'package:flutter/material.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class Abilities extends StatelessWidget {
  const Abilities(
      {Key? key, this.color, this.imageurl, this.displayName, this.description})
      : super(key: key);
  final Color? color;
  final String? imageurl;
  final String? displayName;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 2 * SizeConfig.heightMultiplier,
          vertical: 4 * SizeConfig.widthMultiplier),
      child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: AppTheme.rhino.withOpacity(0.5),
                offset: Offset(2, 3),
                spreadRadius: 1,
                blurRadius: 10)
          ], color: color, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.75 * SizeConfig.heightMultiplier,
                    vertical: 2 * SizeConfig.widthMultiplier),
                child: Image.network(
                  imageurl!,
                  height: 8 * SizeConfig.heightMultiplier,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                width: 65 * SizeConfig.widthMultiplier,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.5 * SizeConfig.heightMultiplier,
                          vertical: 2.25 * SizeConfig.widthMultiplier),
                      child: Text(
                        displayName!,
                        style: TextStyle(
                            color: AppTheme.burnham,
                            fontSize: 3.5 * SizeConfig.textMultiplier),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.5 * SizeConfig.heightMultiplier,
                          vertical: 2 * SizeConfig.widthMultiplier),
                      child: Text(description!, maxLines: 4),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
