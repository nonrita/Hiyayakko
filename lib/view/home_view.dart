import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiyayakko/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.lerp(
                    Alignment.center, Alignment.bottomCenter, 0.7),
                height: height * 0.15,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ホーム',
                      style: TextStyle(
                          fontSize: 48,
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.lerp(
                    Alignment.bottomCenter, Alignment.centerRight, 0.6),
                height: height * 0.85,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/fridge.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Transform.rotate(
                  angle: 8 * pi / 180,
                  child: Container(
                    height: width * 0.5,
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/memo.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          print('a');
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: width,
                height: height * 0.18,
                color: MyColors.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: width * 0.2,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                        color: MyColors.secondaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.kitchen,
                        size: width * 0.18,
                        color: MyColors.bodyColor,
                      ),
                    ),
                    Container(
                      height: width * 0.2,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                        color: MyColors.secondaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.home,
                        size: width * 0.2,
                        color: MyColors.bodyColor,
                      ),
                    ),
                    Container(
                      height: width * 0.2,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                        color: MyColors.secondaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.person,
                        size: width * 0.18,
                        color: MyColors.bodyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width; //親Widgetのwidth
    double h = size.height; //親Widetのheight

    var path = Path();
    path.moveTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, 20);

    var firstControlPoint = Offset(w * 0.1, 0);
    var firstPoint = Offset(w * 0.2, 20);

    var secondControlPoint = Offset(w * 0.3, 40);
    var secondPoint = Offset(w * 0.4, 20);

    var thredControlPoint = Offset(w * 0.5, 0);
    var thredPoint = Offset(w * 0.6, 20);

    var forthControlPoint = Offset(w * 0.7, 40);
    var forthPoint = Offset(w * 0.8, 20);

    var fifthControlPoint = Offset(w * 0.9, 0);
    var fifthPoint = Offset(w, 20);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstPoint.dx,
      firstPoint.dy,
    );
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondPoint.dx,
      secondPoint.dy,
    );
    path.quadraticBezierTo(
      thredControlPoint.dx,
      thredControlPoint.dy,
      thredPoint.dx,
      thredPoint.dy,
    );
    path.quadraticBezierTo(
      forthControlPoint.dx,
      forthControlPoint.dy,
      forthPoint.dx,
      forthPoint.dy,
    );
    path.quadraticBezierTo(
      fifthControlPoint.dx,
      fifthControlPoint.dy,
      fifthPoint.dx,
      fifthPoint.dy,
    );

    path.lineTo(w, 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
