import 'package:flutter/material.dart';
import 'style_guide.dart';
import 'compass_layout.dart';

Widget compass = Center(
  child: Container(
    padding: EdgeInsets.all(10),
    height: 320,
    width: 320,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          spreadRadius: 0.2,
          blurRadius: 5,
          offset: Offset(-4.0, -4.0),
          color: kLightShadowColor,
        ),
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 15,
          offset: Offset(4.0, 4.0),
          color: kDarkShadowColor,
        ),
      ],
      gradient: LinearGradient(
        colors: kGradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: CompassLayout(),
  ),
);