import 'dart:async';

import 'package:flutter/material.dart';
import 'package:valorant/screens/HomePage/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          "https://images.wallpapersden.com/image/download/kay-o-x-jett-valorant-game-hd-poster_bG1pZm6UmZqaraWkpJRmbmdlrWZlbWU.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
