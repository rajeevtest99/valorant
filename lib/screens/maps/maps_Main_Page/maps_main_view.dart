import 'package:flutter/material.dart';

import 'package:valorant/screens/maps/maps_Main_Page/maps_main_api_model.dart';

import 'package:valorant/screens/maps/maps_Main_Page/maps_main_controller.dart';
import 'package:valorant/widgets/common_loader.dart';

import 'widgets/maps_display_card.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  dynamic result;
  Future<MapsModel>? mapsModel;

  @override
  void initState() {
    super.initState();
    mapsModel = MapsApiCont().getMaps();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MapsModel>(
      future: mapsModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List length = snapshot.data!.data!;
          print(length);

          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                var maps = snapshot.data!.data![index];
                return MapsDisplayCard(
                  name: maps.displayName,
                  imageurl: maps.splash,
                  coordinates: maps.coordinates,
                );
              });
        } else if (snapshot.hasError) {
          return SnackBar(content: Text("error occured"));
        } else {
          return CommonLoader();
        }
      },
    );
  }
}
