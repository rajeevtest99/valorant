import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';

class DamageDisplay extends StatefulWidget {
  const DamageDisplay(
      {Key? key,
      @required this.headDamage,
      @required this.bodyDamage,
      @required this.legDamage})
      : super(key: key);
  final String? headDamage;
  final String? bodyDamage;
  final String? legDamage;

  @override
  _DamageDisplayState createState() => _DamageDisplayState();
}

class _DamageDisplayState extends State<DamageDisplay>
    with SingleTickerProviderStateMixin {
  double firstLine = 0.0;
  double secondLine = 0.0;
  double thirdLine = 0.0;

  late AnimationController? _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..forward();
  late Animation<double>? _firstLineAnim, _secondLineAnim, _thirdLineAnim;

  @override
  void initState() {
    super.initState();
    _firstLineAnim = Tween<double>(
            begin: 27 * SizeConfig.widthMultiplier,
            end: 70 * SizeConfig.widthMultiplier)
        .animate(CurvedAnimation(
            parent: _controller!, curve: Curves.linearToEaseOut))
          ..addListener(() {
            setState(() {
              firstLine = _firstLineAnim!.value;
            });
          });

    _secondLineAnim = Tween<double>(
            begin: 35 * SizeConfig.widthMultiplier,
            end: 75 * SizeConfig.widthMultiplier)
        .animate(CurvedAnimation(
            parent: _controller!, curve: Curves.linearToEaseOut))
          ..addListener(() {
            setState(() {
              secondLine = _secondLineAnim!.value;
            });
          });

    _thirdLineAnim = Tween<double>(
            begin: 32 * SizeConfig.widthMultiplier,
            end: 72 * SizeConfig.widthMultiplier)
        .animate(CurvedAnimation(
            parent: _controller!, curve: Curves.linearToEaseOut))
          ..addListener(() {
            setState(() {
              thirdLine = _thirdLineAnim!.value;
            });
          });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.white,
          boxShadow: [BoxShadow(color: AppTheme.brandyRose.withOpacity(0.4))]),
      child: CustomPaint(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5 * SizeConfig.heightMultiplier,
                    vertical: 2 * SizeConfig.widthMultiplier),
                child: Image.asset(
                  "assets/images/shooting_board.png",
                  fit: BoxFit.cover,
                  height: 30 * SizeConfig.heightMultiplier,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5 * SizeConfig.heightMultiplier,
                          vertical: 1 * SizeConfig.widthMultiplier),
                      child: Text(
                        widget.headDamage!,
                        style: TextStyle(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5 * SizeConfig.widthMultiplier),
                      child: Text(
                        widget.bodyDamage!,
                        style: TextStyle(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 7 * SizeConfig.widthMultiplier),
                      child: Text(
                        widget.legDamage!,
                        style: TextStyle(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          foregroundPainter: BuddiesRepaint(
              lineOne: firstLine, lineTwo: secondLine, lineThree: thirdLine)),
    );
  }
}

class BuddiesRepaint extends CustomPainter {
  double? lineOne;
  double? lineTwo;
  double? lineThree;

  BuddiesRepaint(
      {required this.lineOne, required this.lineTwo, required this.lineThree});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.rhino
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    canvas.drawLine(
        Offset(
            27 * SizeConfig.widthMultiplier, 5.5 * SizeConfig.heightMultiplier),
        Offset(lineOne!, 5.5 * SizeConfig.heightMultiplier),
        paint);
    canvas.drawLine(
        Offset(
            35 * SizeConfig.widthMultiplier, 16 * SizeConfig.heightMultiplier),
        Offset(lineTwo!, 16 * SizeConfig.heightMultiplier),
        paint);
    canvas.drawLine(
        Offset(
            32 * SizeConfig.widthMultiplier, 30 * SizeConfig.heightMultiplier),
        Offset(lineThree!, 30 * SizeConfig.heightMultiplier),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
