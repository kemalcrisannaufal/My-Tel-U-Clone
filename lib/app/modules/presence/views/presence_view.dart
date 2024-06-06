import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nice_spot/app/routes/app_pages.dart';
import 'package:nice_spot/app/shared/widgets/appbar.dart';
import 'package:nice_spot/app/views/views/title_view.dart';
import '../controllers/presence_controller.dart';

class PresenceView extends GetView<PresenceController> {
  const PresenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleView(title: "Presensi"),
          SizedBox(height: 10),
          Text(
            "Upload Bukti Perkuliahan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => controller.selectedImagePath.isEmpty
                ? Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      "Tidak ada gambar yang dipilih",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )))
                : Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(),
                    ),
                    child: Image.file(
                      File(controller.selectedImagePath.value),
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectangleButton(
                name: "Buka Kamera",
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
              ),
              SizedBox(width: 10),
              RectangleButton(
                name: "Pilih dari Galeri",
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.red,
        onTap: (value) {
          if (value == 0) {
            Get.toNamed(Routes.HOME);
          } else if (value == 1) {
            Get.toNamed(Routes.LOCATION);
          } else {
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

class RectangleButton extends StatelessWidget {
  final Function()? onPressed;
  final String name;

  RectangleButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
