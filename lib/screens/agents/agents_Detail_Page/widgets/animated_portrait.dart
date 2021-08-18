import 'package:flutter/material.dart';
import 'package:valorant/utils/size_config.dart';

class AnimatedPortrait extends StatefulWidget {
  const AnimatedPortrait({Key? key, required this.imageurl}) : super(key: key);
  final String? imageurl;

  @override
  _AnimatedPortraitState createState() => _AnimatedPortraitState();
}

class _AnimatedPortraitState extends State<AnimatedPortrait>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 4),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation =
      Tween<Offset>(begin: Offset(0.8, 0), end: Offset(0.88, 0)).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut));

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation,
        child: Image.network(
          widget.imageurl!,
          fit: BoxFit.cover,
          height: 25 * SizeConfig.heightMultiplier,
          // width: 55 * SizeConfig.widthMultiplier,
        ));
  }
}
