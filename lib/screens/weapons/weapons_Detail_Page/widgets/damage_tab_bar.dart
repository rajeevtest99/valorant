import 'package:flutter/material.dart';
import 'package:valorant/screens/weapons/weapons_Detail_Page/widgets/damage_display_tab.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class DamageTabBar extends StatefulWidget {
  const DamageTabBar({
    Key? key,
    required this.damageRanges,
  }) : super(key: key);
  final List? damageRanges;

  @override
  _DamageTabBarState createState() => _DamageTabBarState();
}

class _DamageTabBarState extends State<DamageTabBar> {
  @override
  void initState() {
    super.initState();
    print(widget.damageRanges);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.damageRanges!.length,
      child: Container(
        height: 50 * SizeConfig.heightMultiplier,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 5 * SizeConfig.heightMultiplier,
                child: TabBar(
                    unselectedLabelColor: AppTheme.jasper,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    indicatorColor: AppTheme.museli,
                    isScrollable: true,
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Coolvetica',
                        fontSize: 2.5 * SizeConfig.textMultiplier),
                    tabs: List<Widget>.generate(widget.damageRanges!.length,
                        (index) {
                      return Tab(
                        child: Text(
                          "${widget.damageRanges![index]['rangeStartMeters'].toString()} - ${widget.damageRanges![index]['rangeEndMeters'].toString()} M",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    })),
              ),
            ),
            Container(
              height: 40 * SizeConfig.heightMultiplier,
              child: TabBarView(
                  children: List<Widget>.generate(widget.damageRanges!.length,
                      (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DamageDisplay(
                    headDamage:
                        "${widget.damageRanges![index]['headDamage'].toString()}",
                    bodyDamage:
                        "${widget.damageRanges![index]['bodyDamage'].toString()}",
                    legDamage:
                        "${widget.damageRanges![index]['legDamage'].toString()}",
                  ),
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}
