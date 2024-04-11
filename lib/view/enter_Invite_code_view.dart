import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiyayakko/colors.dart';
import 'package:hiyayakko/view/components/background.dart';
import 'package:hiyayakko/view/components/custom_elevated_button.dart';
import 'package:hiyayakko/view/components/custom_text_form_field.dart';

class EnterInviteCodeView extends ConsumerWidget {
  const EnterInviteCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final headerHeight = height * 0.3;
    final header = SizedBox(
      height: headerHeight,
    );

    final mainHeight = height * 0.33;
    final main = SizedBox(
      height: mainHeight,
      child: Column(
        children: [
          const Text(
            '招待コード',
            style: TextStyle(
              fontSize: 32,
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            '招待コードを入力してください',
            style: TextStyle(
              fontSize: 24,
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          CustomTextFormField(
            height: width * 0.15,
            width: width * 0.8,
            labelText: '招待コード',
            hintText: '招待コードを入力してください',
            onChanged: () {},
          ),
          SizedBox(
            height: mainHeight * 0.1,
          ),
          CustomElevatedButton(
            height: width * 0.15,
            width: width * 0.7,
            text: '入力',
            onPressed: () {},
            foregroundColor: MyColors.bodyColor,
            backgroundColor: MyColors.primaryColor,
          ),
        ],
      ),
    );

    final footerHeight = height * 0.37;
    final footer = SizedBox(
      height: footerHeight,
    );

    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Background(height: footerHeight),
            Center(
              child: Column(
                children: [
                  header,
                  main,
                  footer,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
