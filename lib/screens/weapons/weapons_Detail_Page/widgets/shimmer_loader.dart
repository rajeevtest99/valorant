import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Image.asset(
          "assets/images/displayicon.png",
          height: 10 * SizeConfig.heightMultiplier,
        ),
        baseColor: AppTheme.rhino.withOpacity(0.5),
        highlightColor: AppTheme.white.withOpacity(0.2));
  }
}
