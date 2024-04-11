import 'package:flutter/material.dart';

class CustomDropButton extends StatelessWidget {
  final double width;
  final List<DropdownMenuItem> items;
  final Color primaryColor;
  final Function onChanged;
  final dynamic value;
  const CustomDropButton({
    Key? key,
    required this.width,
    required this.items,
    required this.primaryColor,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField(
        value: value,
        items: items,
        onChanged: (newGender) {
          onChanged(newGender);
        },
        iconEnabledColor: primaryColor,
        decoration: InputDecoration(
          label: const Text('性別'),
          labelStyle: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}
