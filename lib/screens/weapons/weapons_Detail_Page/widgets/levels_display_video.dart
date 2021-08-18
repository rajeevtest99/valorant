import 'package:flutter/material.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_detail_api_cont.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_details_page_models/details_skin.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/widgets/skins_video_player.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';
import 'package:valorant/widgets/common_loader.dart';

class LevelDisplayVideo extends StatefulWidget {
  const LevelDisplayVideo({Key? key, @required this.skinUrl}) : super(key: key);
  final String? skinUrl;

  @override
  _LevelDisplayVideoState createState() => _LevelDisplayVideoState();
}

class _LevelDisplayVideoState extends State<LevelDisplayVideo> {
  bool showVideo = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailSkin>(
        future: WeaponsDetailedApiCont().getDetailedWeaponSkin(widget.skinUrl),
        builder: (context, skinSnapshot) {
          if (skinSnapshot.connectionState == ConnectionState.done &&
              skinSnapshot.hasData) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: AppTheme.rhino)),
                  elevation: 0,
                  backgroundColor: AppTheme.white,
                  title: Text(
                    skinSnapshot.data!.data!.displayName!,
                    style: TextStyle(color: AppTheme.burnham),
                  ),
                ),
                body: ListView(
                  children: [
                    ...skinSnapshot.data!.data!.levels!.map((e) =>
                        LevelsDisplayCard(
                            displayName: e.displayName,
                            displayIcon: e.displayIcon,
                            displayVideo: e.streamedVideo))
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(body: CommonLoader());
          }
        });
  }
}

class LevelsDisplayCard extends StatefulWidget {
  const LevelsDisplayCard(
      {Key? key,
      required this.displayName,
      required this.displayIcon,
      required this.displayVideo})
      : super(key: key);
  final String? displayName;
  final String? displayIcon;
  final String? displayVideo;

  @override
  _LevelsDisplayCardState createState() => _LevelsDisplayCardState();
}

class _LevelsDisplayCardState extends State<LevelsDisplayCard> {
  bool showVideo = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 2 * SizeConfig.heightMultiplier,
              vertical: 2 * SizeConfig.widthMultiplier),
          child:
              Text(widget.displayName == null ? "no name" : widget.displayName!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 3 * SizeConfig.textMultiplier,
                    color: AppTheme.burnham,
                  )),
        ),
        widget.displayIcon == null
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 4 * SizeConfig.heightMultiplier,
                    vertical: 4 * SizeConfig.widthMultiplier),
                child: Image.network(
                  widget.displayIcon!,
                  height: 10 * SizeConfig.heightMultiplier,
                ),
              ),
        widget.displayVideo == null
            ? Container()
            : GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "This video is high resolution video, and size can goes upto 24mb. Would you like to watch the video?",
                            style: TextStyle(
                                fontSize: 2 * SizeConfig.textMultiplier),
                          ),
                          actions: [
                            RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              fillColor: AppTheme.waterMelon,
                              child: Text("close"),
                            ),
                            RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                setState(() {
                                  if (showVideo == false) {
                                    showVideo = true;
                                  } else {
                                    showVideo = false;
                                  }
                                });
                                Navigator.pop(context);
                              },
                              fillColor: AppTheme.rhino,
                              child: Text(
                                "watch",
                                style: TextStyle(color: AppTheme.white),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2 * SizeConfig.heightMultiplier,
                      vertical: 2 * SizeConfig.widthMultiplier),
                  child: Text('show video',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 2 * SizeConfig.textMultiplier,
                        color: AppTheme.rhino,
                      )),
                )),
        showVideo
            ? widget.displayVideo == null
                ? Container()
                : SkinsVideoPlayer(videourl: widget.displayVideo)
            : Container()
      ],
    );
  }
}
