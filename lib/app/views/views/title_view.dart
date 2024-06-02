import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TitleView extends GetView {
  final String title;
  const TitleView({
    required this.title,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
