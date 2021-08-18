import 'package:flutter/material.dart';

import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_detail_api_cont.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/weapons_detailed_model.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/widgets/damage_tab_bar.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';
import 'package:valorant/widgets/common_loader.dart';

import 'widgets/skin_slider.dart';

class WeaponsDetailedView extends StatefulWidget {
  const WeaponsDetailedView({Key? key, @required this.uuid}) : super(key: key);
  final String? uuid;

  @override
  _WeaponsDetailedViewState createState() => _WeaponsDetailedViewState();
}

class _WeaponsDetailedViewState extends State<WeaponsDetailedView> {
  Future<WeaponsDetail>? weapondetail;

  String? videoUrl;
  String? skinUrl;

  @override
  Widget build(BuildContext context) {
    var weapon = {"status": "no"};
    List weaponData = [];
    print(widget.uuid);
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<dynamic>(
              future: WeaponsDetailedApiCont().getDetailedWeapon(widget.uuid!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!['data'];
                  var weapondata = data['weaponStats'] == null
                      ? weapon
                      : data['weaponStats'];

                  List damageRanges = weapondata["damageRanges"] == null
                      ? weaponData
                      : weapondata["damageRanges"];

                  var shopData =
                      data['shopData'] == null ? weapon : data['shopData'];

                  List skins = data['skins'];
                  // ignore: unused_local_variable
                  var removeStandard = skins.removeWhere((element) =>
                      element['displayName'] ==
                      "Standard ${data['displayName']}");

                  return NestedScrollView(
                    headerSliverBuilder: (context, value) {
                      return [
                        SliverAppBar(
                          backgroundColor: AppTheme.rhino,
                          stretch: true,
                          pinned: true,
                          centerTitle: false,
                          expandedHeight: 25 * SizeConfig.heightMultiplier,
                          collapsedHeight: 7.5 * SizeConfig.heightMultiplier,
                          leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                          flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                              data["displayName"],
                              style: TextStyle(
                                  fontSize: 4 * SizeConfig.textMultiplier),
                            ),
                            background: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://wallpapercave.com/wp/wp8349785.jpg"),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        AppTheme.black.withOpacity(0.9),
                                        Colors.transparent
                                      ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.center)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            4 * SizeConfig.heightMultiplier,
                                        vertical:
                                            6 * SizeConfig.widthMultiplier),
                                    child: Image.network(data["displayIcon"],
                                        height:
                                            5 * SizeConfig.heightMultiplier),
                                  ),
                                )),
                          ),
                        )
                      ];
                    },
                    body: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2 * SizeConfig.heightMultiplier,
                              vertical: 2 * SizeConfig.widthMultiplier),
                          child: Text(
                            'Catergory',
                            style: TextStyle(
                                color: AppTheme.waterMelon,
                                fontSize: 3 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4 * SizeConfig.heightMultiplier,
                              vertical: 2 * SizeConfig.widthMultiplier),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shopData['categoryText'] == null
                                    ? "Melee"
                                    : shopData['categoryText'],
                                style: TextStyle(
                                    fontSize: 3 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w500),
                              ),
                              shopData['cost'] == null
                                  ? Container()
                                  : Text(
                                      "cost : \$ ${shopData['cost']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )
                            ],
                          ),
                        ),
                        data['weaponStats'] == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2 * SizeConfig.heightMultiplier,
                                    vertical: 2 * SizeConfig.widthMultiplier),
                                child: Text(
                                  "Stats",
                                  style: TextStyle(
                                      color: AppTheme.waterMelon,
                                      fontSize: 3 * SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                        data['weaponStats'] == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4 * SizeConfig.heightMultiplier,
                                    vertical: 0.5 * SizeConfig.widthMultiplier),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Fire Rate : ',
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize:
                                                2.5 * SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "${weapondata['fireRate']}",
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize: 2.25 *
                                                SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ])),
                              ),
                        data['weaponStats'] == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4 * SizeConfig.heightMultiplier,
                                    vertical: 0.5 * SizeConfig.widthMultiplier),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Magazine Size : ',
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize:
                                                2.5 * SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "${weapondata['magazineSize']}",
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize: 2.25 *
                                                SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ])),
                              ),
                        data['weaponStats'] == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4 * SizeConfig.heightMultiplier,
                                    vertical: 0.5 * SizeConfig.widthMultiplier),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Reload Time : ',
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize:
                                                2.5 * SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text:
                                            "${weapondata['reloadTimeSeconds']} seconds",
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize: 2.25 *
                                                SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ])),
                              ),
                        data['weaponStats'] == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4 * SizeConfig.heightMultiplier,
                                    vertical: 0.5 * SizeConfig.widthMultiplier),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'First Bullet Accuracy : ',
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize:
                                                2.5 * SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text:
                                            "${weapondata['firstBulletAccuracy']}",
                                        style: TextStyle(
                                            color: AppTheme.burnham,
                                            fontFamily: 'Coolvetica',
                                            fontSize: 2.25 *
                                                SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ])),
                              ),
                        data['weaponStats'] == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2 * SizeConfig.heightMultiplier,
                                    vertical: 3 * SizeConfig.widthMultiplier),
                                child: Text(
                                  "Damage",
                                  style: TextStyle(
                                      color: AppTheme.waterMelon,
                                      fontSize: 3 * SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                        data['weaponStats'] == null
                            ? Container()
                            : DamageTabBar(
                                damageRanges: damageRanges,
                              ),
                        data['weaponStats'] == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2 * SizeConfig.heightMultiplier,
                                    vertical: 2 * SizeConfig.widthMultiplier),
                                child: Text(
                                  "Skins",
                                  style: TextStyle(
                                      color: AppTheme.waterMelon,
                                      fontSize: 3 * SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2 * SizeConfig.heightMultiplier,
                                vertical: 2 * SizeConfig.widthMultiplier),
                            child: Row(
                              children: [
                                ...skins.map((e) => SkinSlider(
                                      skinuuid: e['uuid'],
                                      displayName: e['displayName'],
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return CommonLoader();
                }
              })),
    );
  }
}
