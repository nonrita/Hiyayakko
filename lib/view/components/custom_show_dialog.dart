import 'package:flutter/material.dart';
import 'package:hiyayakko/colors.dart';
import 'package:hiyayakko/view/components/custom_elevated_button.dart';

void customShowDialog(BuildContext context, String errorText) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      final double width = MediaQuery.of(context).size.width;
      return AlertDialog(
        buttonPadding: const EdgeInsets.all(20),
        title: Center(
            child: Text(
          errorText,
          style: const TextStyle(color: MyColors.darkGrayColor),
        )),
        actions: <Widget>[
          Center(
            child: CustomElevatedButton(
              height: width * 0.1,
              width: width * 0.3,
              text: 'OK',
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              foregroundColor: MyColors.bodyColor,
              backgroundColor: MyColors.primaryColor,
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), //丸み
          side: const BorderSide(
            color: MyColors.primaryColor,
            width: 8, //枠線の色
          ),
        ),
      );
    },
  );
}
