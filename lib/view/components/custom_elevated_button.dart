import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function? onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  const CustomElevatedButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    this.onPressed = null,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed == null
            ? null
            : () {
                onPressed!();
              },
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
