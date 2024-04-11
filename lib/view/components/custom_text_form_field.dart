import 'package:flutter/material.dart';
import 'package:hiyayakko/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final double height;
  final double width;
  final String labelText;
  final String hintText;
  final Function onChanged;
  final bool obscureText;
  const CustomTextFormField({
    Key? key,
    this.obscureText = false,
    required this.height,
    required this.width,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        obscureText: obscureText,
        onChanged: (value) => onChanged(value),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: MyColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: MyColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: MyColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}
