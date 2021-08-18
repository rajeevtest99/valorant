import 'package:flutter/material.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_detail_api_cont.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_details_page_models/detail_chroma.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_details_page_models/details_skin.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/widgets/levels_display_video.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/widgets/shimmer_loader.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class SkinSlider extends StatefulWidget {
  const SkinSlider({Key? key, required this.skinuuid, this.displayName})
      : super(key: key);
  final String? skinuuid;
  final String? displayName;

  @override
  _SkinSliderState createState() => _SkinSliderState();
}

class _SkinSliderState extends State<SkinSlider> {
  String? skinUrl;
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 1 * SizeConfig.heightMultiplier,
          vertical: 1 * SizeConfig.widthMultiplier),
      child: Container(
        height: 28 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: NetworkImage(
            //         "https://wallpaperaccess.com/download/valorant-logo-2576101"),
            //     fit: BoxFit.cover),
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: AppTheme.black.withOpacity(0.5))]),
        child: FutureBuilder<DetailSkin>(
            future: WeaponsDetailedApiCont()
                .getDetailedWeaponSkin(widget.skinuuid!),
            builder: (context, skinsnapshot) {
              if (skinsnapshot.connectionState == ConnectionState.done) {
                var checkLevelVideo = skinsnapshot.data!.data!.levels!
                    .every((element) => element.streamedVideo != null);
                return GestureDetector(
                  onTap: checkLevelVideo
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LevelDisplayVideo(
                                      skinUrl: widget.skinuuid)));
                        }
                      : () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4 * SizeConfig.heightMultiplier,
                            vertical: 4 * SizeConfig.widthMultiplier),
                        child: Text(widget.displayName!),
                      ),
                      skinsnapshot.data!.data!.displayIcon == null
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2 * SizeConfig.heightMultiplier,
                                  vertical: 2 * SizeConfig.widthMultiplier),
                              child: Image.network(
                                skinsnapshot.data!.data!.chromas![0]
                                            .displayIcon ==
                                        null
                                    ? skinsnapshot
                                        .data!.data!.chromas![0].fullRender!
                                    : skinsnapshot
                                        .data!.data!.chromas![0].displayIcon!,
                                height: 10 * SizeConfig.heightMultiplier,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4 * SizeConfig.heightMultiplier,
                                  vertical: 2 * SizeConfig.widthMultiplier),
                              child: FutureBuilder<DetailChroma>(
                                  future: WeaponsDetailedApiCont()
                                      .getDetailedWeaponChroma(skinUrl),
                                  builder: (context, chromasnapshot) {
                                    if (chromasnapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Image.network(
                                        skinUrl == null
                                            ? skinsnapshot
                                                .data!.data!.displayIcon!
                                            : chromasnapshot
                                                .data!.data!.displayIcon!,
                                        height:
                                            10 * SizeConfig.heightMultiplier,
                                      );
                                    } else {
                                      return ShimmerLoader();
                                    }
                                  }),
                            ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4 * SizeConfig.heightMultiplier,
                        ),
                        child: Row(
                          children: [
                            ...skinsnapshot.data!.data!.chromas!
                                .map((e) => e.swatch == null
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            skinUrl = e.uuid!;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            e.swatch!,
                                            height:
                                                3 * SizeConfig.heightMultiplier,
                                          ),
                                        ),
                                      ))
                          ],
                        ),
                      ),
                      checkLevelVideo
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4 * SizeConfig.heightMultiplier,
                                  vertical: 2 * SizeConfig.widthMultiplier),
                              child: Text(
                                "show Video",
                                style: TextStyle(color: AppTheme.burnham),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              } else {
                return ShimmerLoader();
              }
            }),
      ),
    );
  }
}
