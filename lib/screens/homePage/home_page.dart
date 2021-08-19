import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:valorant/notifications/on_start_notifications.dart';

import 'package:valorant/screens/agents/agents_Detail_Page/agents_detail_view.dart';
import 'package:valorant/screens/agents/agents_Main_Page/agents_main_page_view.dart';

import 'package:valorant/screens/maps/maps_Main_Page/maps_main_view.dart';

import 'package:valorant/screens/weapons/weapons_Main_Page/weapons_main_view.dart';

import 'package:valorant/utils/size_config.dart';

import 'package:valorant/utils/styling.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    //notification request permission

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (isAllowed == false) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Do you want to recieve notifications?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        AwesomeNotifications()
                            .requestPermissionToSendNotifications()
                            .then((_) => Navigator.pop(context));
                      },
                      child: Text("Yes")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("no"))
                ],
              );
            });
      }
    });

    //sending notification

    createOnStartNotif();
    Timer(Duration(seconds: 20), createOnStartNotifRaze);
    Timer(Duration(seconds: 35), createOnStartNotifSage);

    //notification action listener

    AwesomeNotifications().actionStream.listen((event) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => AgentsDetailView(agentuuid: event.summary)),
          (route) => route.isFirst);
    });

    print(alignAnim.value);
  }

  @override
  void dispose() {
    //disposing notification sink

    AwesomeNotifications().actionSink.close();
    _animCont.dispose();
    super.dispose();
  }

  // animation for drawer background image

  late AnimationController _animCont =
      AnimationController(vsync: this, duration: Duration(milliseconds: 700))
        ..repeat();

  late Animation<Alignment> alignAnim = Tween<Alignment>(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ).animate(CurvedAnimation(parent: _animCont, curve: Curves.decelerate));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: AppTheme.white.withOpacity(0.95),
            drawer: drawer(context),
            appBar: AppBar(
              toolbarHeight: 15 * SizeConfig.heightMultiplier,
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://i.imgur.com/n9XgfN7.jpeg"),
                        fit: BoxFit.cover)),
                child: Container(
                    decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                        0,
                        2,
                      ],
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.1)
                      ]),
                )),
              ),
              leading: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 1.5 * SizeConfig.heightMultiplier,
                    vertical: 2 * SizeConfig.widthMultiplier),
                child: Builder(
                  builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: AppTheme.rhino,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppTheme.museli,
                isScrollable: true,
                indicatorWeight: 5,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: 3.5 * SizeConfig.heightMultiplier,
                    vertical: 2 * SizeConfig.widthMultiplier),
                tabs: [
                  Tab(
                    child: Text(
                      "agents",
                      style: TextStyle(
                          fontSize: 4 * SizeConfig.textMultiplier,
                          color: AppTheme.rhino),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "maps",
                      style: TextStyle(
                          fontSize: 4 * SizeConfig.textMultiplier,
                          color: AppTheme.rhino),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "weapons",
                      style: TextStyle(
                          fontSize: 4 * SizeConfig.textMultiplier,
                          color: AppTheme.rhino),
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              child: TabBarView(children: [Agents(), Maps(), WeaponsView()]),
            ),
          )),
    );
  }

  //homepage drawer

  Widget drawer(BuildContext context) {
    return Container(
      width: 65 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        color: AppTheme.white,
        // image: DecorationImage(
        //     alignment: alignAnim.value,
        //     image: NetworkImage(
        //       "https://images.wallpapersden.com/image/download/valorant-game-team_bGZnbGeUmZqaraWkpJRmbmdlrWZlbWU.jpg",
        //     ),
        //     fit: BoxFit.cover)
      ),
      child: Column(
        children: [
          Image.network(
              "https://st4.depositphotos.com/35426512/40205/v/950/depositphotos_402050006-stock-illustration-logo-valorant-shooter-game-symbol.jpg"),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4 * SizeConfig.heightMultiplier,
                vertical: 6 * SizeConfig.widthMultiplier),
            child: RichText(
                text: TextSpan(
                    text: "Credits : ",
                    style: TextStyle(
                        fontFamily: 'Coolvetica',
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        color: AppTheme.burnham,
                        fontWeight: FontWeight.w600),
                    children: [
                  TextSpan(
                    text: "valorant-api.com",
                    style: TextStyle(
                        fontFamily: 'Coolvetica',
                        fontSize: 2 * SizeConfig.textMultiplier,
                        color: AppTheme.jasper,
                        fontWeight: FontWeight.w500),
                  )
                ])),
          )
        ],
      ),
    );
  }
}
