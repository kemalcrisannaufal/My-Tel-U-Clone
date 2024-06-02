import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nice_spot/app/modules/home/controllers/home_controller.dart';
import 'package:nice_spot/app/modules/home/views/schedule_view.dart';
import 'package:nice_spot/app/shared/widgets/appbar.dart';
import 'package:nice_spot/app/views/views/title_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20.0),
          child: ListView(
            children: [
              TitleView(title: "Jadwal"),
              Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ScheduleView();
                    }),
              ),
              TitleView(title: "Location"),
              Container(
                height: 300,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                ),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-6.972976375763006, 107.63167734862716),
                    zoom: 15.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("1"),
                      position: LatLng(-6.972976375763006, 107.63167734862716),
                    )
                  },
                ),
              )
            ],
          ),
        ));
  }
}
