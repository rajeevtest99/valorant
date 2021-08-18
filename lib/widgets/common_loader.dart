import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 4 * SizeConfig.heightMultiplier,
              vertical: 6 * SizeConfig.widthMultiplier),
          child: Lottie.asset("assets/images/loader.json"),
        )),
        Center(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/loader.gif",
                height: 15 * SizeConfig.heightMultiplier,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              color: AppTheme.burnham,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
