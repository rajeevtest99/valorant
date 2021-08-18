import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:valorant/notifications/notification_channels.dart';
import 'package:valorant/screens/splash_screen.dart';
import 'package:valorant/utils/size_config.dart';

void main() async {
  AwesomeNotifications()
      .initialize("resource://drawable/res_notif_logo", notifchannels);

  await Hive.initFlutter();
  await Hive.openBox("ON_START_NOTIF");
  await Hive.openBox("AGENTS_API_CACHE");
  await Hive.openBox("MAPS_API_CACHE");
  await Hive.openBox("WEAPONS_API_CACHE");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        return MaterialApp(
          home: SplashScreen(),
          theme: ThemeData(fontFamily: "Coolvetica"),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
