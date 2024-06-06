import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nice_spot/app/routes/app_pages.dart';
import 'package:nice_spot/app/shared/widgets/appbar.dart';
import 'package:nice_spot/app/views/views/title_view.dart';

import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 10),
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: TitleView(title: "Telkom University Location")),
            Container(
              height: 400,
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
            ),
            SizedBox(height: 15),
            Container(
              child: Text(
                "Telkom University bertekad menjadi research and entrepreneurial university yang bermanfaat untuk masyarakat. Sejalan dengan ini, kami berharap mampu menghasilkan lulusan yang memiliki daya saing global serta mampu menciptakan budaya riset dan inovasi yang bermanfaat dalam meningkatkan kualitas hidup masyarakat, lebih jauh, mampu berkontribusi dalam pembangunan ekonomi nasional melalui pengembangan entrepreneurship.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.red,
        onTap: (value) {
          if (value == 0) {
            Get.toNamed(Routes.HOME);
          } else if (value == 1) {
            Get.toNamed(Routes.LOCATION);
          } else if (value == 2) {
            Get.toNamed(Routes.PRESENCE);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Presensi",
          ),
        ],
      ),
    );
  }
}
