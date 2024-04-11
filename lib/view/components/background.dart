import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hiyayakko/colors.dart';

class Background extends StatelessWidget {
  final double height;
  const Background({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraint) {
        final width = contraint.maxWidth;

        //Stackの追加
        return Stack(
          children: <Widget>[
            Container(
              color: MyColors.bodyColor,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: width,
                  height: height,
                  color: MyColors.primaryColor,
                  child: Stack(
                    children: [
                      Positioned(
                        top: height * 0.3,
                        left: width * -0.1,
                        child: Transform.rotate(
                          angle: 25 * pi / 180,
                          child: BoxItem(width: width),
                        ),
                      ),
                      Positioned(
                        top: height * 0.35,
                        left: width * 0.8,
                        child: Transform.rotate(
                          angle: 40 * pi / 180,
                          child: BoxItem(width: width),
                        ),
                      ),
                      Positioned(
                        top: height * 0.85,
                        left: width * 0.25,
                        child: Transform.rotate(
                          angle: 60 * pi / 180,
                          child: BoxItem(width: width),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width; //親Widgetのwidth
    double h = size.height; //親Widetのheight

    var path = new Path();
    path.moveTo(0, h);
    path.lineTo(w, h);

    path.lineTo(w, 30);
    var firstControlPoint = Offset(w * 0.75, 60);
    var firstEndPoint = Offset(w * 0.5, 30);
    var secondControlPoint = Offset(w * 0.25, 0);
    var secondEndPoint = const Offset(0, 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BoxItem extends StatelessWidget {
  final double width;
  const BoxItem({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width / 3,
      width: width / 3,
      decoration: BoxDecoration(
        color: MyColors.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
