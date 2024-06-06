import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nice_spot/app/modules/home/controllers/home_controller.dart';
import 'package:nice_spot/app/modules/home/controllers/news_controller.dart';
import 'package:nice_spot/app/modules/home/views/menu_item_view.dart';
import 'package:nice_spot/app/modules/home/views/schedule_view.dart';
import 'package:nice_spot/app/routes/app_pages.dart';
import 'package:nice_spot/app/shared/widgets/appbar.dart';
import 'package:nice_spot/app/views/views/title_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsC = Get.put(NewsController());
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
                    return ScheduleView(
                      name: "Aplikasi Berbasis Platform",
                      place: "TULT 0701",
                      time: "10.00 - 12.00",
                    );
                  }),
            ),
            TitleView(title: "Fitur Aplikasi"),
            Container(
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.menu.length,
                  itemBuilder: (context, index) {
                    return MenuItemView(
                      name: controller.menu[index],
                      iconData: controller.menuIcon[index],
                      onTap: controller.menuOnTap[index],
                    );
                  }),
            ),
            TitleView(title: "Berita Terbaru"),
            Container(
              height: newsC.news.length * 110,
              child: ListView.builder(
                  itemCount: newsC.news.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                        color: Colors.grey[50],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Image.network(
                              newsC.news[index].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text(newsC.news[index].title!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            TitleView(title: "Location"),
            Container(
              height: 150,
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: (value) {
          if (value == 0) {
            Get.toNamed(Routes.HOME);
          } else if (value == 1) {
            Get.toNamed(Routes.LOCATION);
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
