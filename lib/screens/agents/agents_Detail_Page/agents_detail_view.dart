import 'package:flutter/material.dart';

import 'package:valorant/screens/agents/agents_Detail_Page/agents_detail_api_model.dart';
import 'package:valorant/screens/agents/agents_Detail_Page/agents_detail_controller.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';
import 'package:valorant/widgets/common_loader.dart';

import 'widgets/abilities.dart';
import 'widgets/animated_portrait.dart';

class AgentsDetailView extends StatefulWidget {
  const AgentsDetailView({Key? key, @required this.agentuuid})
      : super(key: key);
  final String? agentuuid;

  @override
  _AgentsDetailViewState createState() => _AgentsDetailViewState();
}

class _AgentsDetailViewState extends State<AgentsDetailView>
    with TickerProviderStateMixin {
  Future<ValoAgentsDetailModel>? valoagentsdetailed;

  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 1400))
        ..forward();
  late Animation<Offset> _animation =
      Tween<Offset>(begin: Offset(0, 4), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<ValoAgentsDetailModel>(
            future: ValoAgentDetailedApiCont().valoGetAgents(widget.agentuuid!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                    body: ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "https://wallpapercave.com/wp/wp6212343.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              AnimatedPortrait(
                                  imageurl: snapshot.data!.data!.bustPortrait),
                              Container(
                                alignment: Alignment.bottomLeft,
                                height: 25 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4 * SizeConfig.heightMultiplier,
                                    vertical: 4 * SizeConfig.widthMultiplier),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      AppTheme.rhino,
                                      Colors.transparent
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center)),
                                child: Text(snapshot.data!.data!.displayName!,
                                    style: TextStyle(
                                        fontSize: 5 * SizeConfig.textMultiplier,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.waterMelon,
                                        letterSpacing:
                                            0.3 * SizeConfig.widthMultiplier)),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 2 * SizeConfig.heightMultiplier,
                          left: 2 * SizeConfig.widthMultiplier,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppTheme.jasper,
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.heightMultiplier,
                          vertical: 4 * SizeConfig.widthMultiplier),
                      child: SlideTransition(
                        position: _animation,
                        child: Row(
                          children: [
                            Image.network(
                              snapshot.data!.data!.role!.displayIcon!,
                              color: AppTheme.burnham,
                              height: 4 * SizeConfig.heightMultiplier,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                snapshot.data!.data!.role!.displayName!,
                                style: TextStyle(
                                    fontSize: 3.5 * SizeConfig.textMultiplier,
                                    color: AppTheme.burnham,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing:
                                        0.25 * SizeConfig.widthMultiplier),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.heightMultiplier,
                          vertical: 3 * SizeConfig.widthMultiplier),
                      child: SlideTransition(
                        position: _animation,
                        child: Text(
                          snapshot.data!.data!.role!.description!,
                          style: TextStyle(
                            fontSize: 3 * SizeConfig.textMultiplier,
                            color: AppTheme.burnham,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.heightMultiplier,
                          vertical: 4 * SizeConfig.widthMultiplier),
                      child: SlideTransition(
                        position: _animation,
                        child: Text(
                          "Abilities",
                          style: TextStyle(
                              fontSize: 3.5 * SizeConfig.textMultiplier,
                              color: AppTheme.burnham,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.25 * SizeConfig.widthMultiplier),
                        ),
                      ),
                    ),
                    ...snapshot.data!.data!.abilities!.map((ability) {
                      return ability.displayIcon == null
                          ? Container()
                          : SlideTransition(
                              position: _animation,
                              child: Abilities(
                                color: ability.slot == "Ultimate"
                                    ? AppTheme.jasper
                                    : AppTheme.burnham,
                                displayName: ability.displayName,
                                description: ability.description,
                                imageurl: ability.displayIcon,
                              ),
                            );
                    }).toList()
                  ],
                ));
              } else {
                return Scaffold(
                  body: CommonLoader(),
                );
              }
            }));
  }
}
