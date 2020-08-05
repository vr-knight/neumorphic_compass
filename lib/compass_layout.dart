import 'package:flutter/material.dart';
import 'package:neumorphic_compass/style_guide.dart';

class CompassLayout extends StatelessWidget {
  double getRadiansFromDegrees(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: kBackgroundColor,
                shape: BoxShape.circle,
                border: Border.all(color: kBorderColor, width: 5)),
          ),
        ),
//        Center(
//          child: Container(
//            height: 100,
//            width: 100,
//            decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                border: Border.all(color: Colors.white)),
//          ),
//        ),

        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'N',
            style: kDirectionStyle,
          ),
        ), //N
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'W',
            style: kDirectionStyle,
          ),
        ), //W
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'E',
            style: kDirectionStyle,
          ),
        ), //E
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'S',
            style: kDirectionStyle,
          ),
        ), //S
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegrees(315), -140),
            child: Transform.rotate(
              angle: getRadiansFromDegrees(45),
              child: Text(
                'SW',
                style: kDirectionStyle,
              ),
            ),
          ),
        ), //SW
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegrees(315), 140),
            child: Transform.rotate(
              angle: getRadiansFromDegrees(45),
              child: Text(
                'NE',
                style: kDirectionStyle,
              ),
            ),
          ),
        ), //NE
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegrees(225), 140),
            child: Transform.rotate(
              angle: getRadiansFromDegrees(-45),
              child: Text(
                'NW',
                style: kDirectionStyle,
              ),
            ),
          ),
        ), //NW
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegrees(225), -140),
            child: Transform.rotate(
              angle: getRadiansFromDegrees(-45),
              child: Text(
                'SE',
                style: kDirectionStyle,
              ),
            ),
          ),
        ), //SE
        Positioned(
          right: 142,
          left: 142,
          top: 35,
          bottom: 35,
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.48, 0.48]),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: kBackgroundColor,
                shape: BoxShape.circle,
                border: Border.all(color: kBorderColor, width: 3)),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 2, 0.0);
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}