import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getimageicon(double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/Image/Splashscreen.png'),
      ),
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
