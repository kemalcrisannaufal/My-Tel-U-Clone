import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuItemView extends GetView {
  final String name;
  final IconData iconData;
  final Function()? onTap;
  const MenuItemView({
    required this.name,
    required this.iconData,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.redAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 18,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
