import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<String> menu = [
    'My Tuctuc',
    'Schedule',
    'Location',
    'Presensi',
    'Calendar',
  ];
  final List<IconData> menuIcon = [
    FontAwesomeIcons.car, // untuk ikon "My Tuctuc"
    FontAwesomeIcons.calendar, // untuk ikon "Schedule"
    FontAwesomeIcons.mapPin, // untuk ikon "Location"
    FontAwesomeIcons.calendarCheck, // untuk ikon "Calendar"
    FontAwesomeIcons.userClock, // untuk ikon "Presensi"
  ];
}
