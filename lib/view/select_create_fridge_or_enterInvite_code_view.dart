import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hiyayakko/colors.dart';
import 'package:hiyayakko/view/components/background.dart';
import 'package:hiyayakko/view/components/custom_elevated_button.dart';

class SelectCreateFridgeOrEnterInviteCodeView extends ConsumerWidget {
  const SelectCreateFridgeOrEnterInviteCodeView({Key? key}) : super(key: key);

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
            '冷蔵庫作成or招待コード入力',
            style: TextStyle(
              fontSize: 26,
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'どちらかを選択してください',
            style: TextStyle(
              fontSize: 24,
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          CustomElevatedButton(
            height: width * 0.15,
            width: width * 0.8,
            text: '冷蔵庫制作',
            onPressed: () {
              context.go('/signUp/createFridge');
            },
            foregroundColor: MyColors.bodyColor,
            backgroundColor: MyColors.primaryColor,
          ),
          SizedBox(
            height: mainHeight * 0.05,
          ),
          CustomElevatedButton(
            height: width * 0.15,
            width: width * 0.8,
            text: '招待コード入力',
            // onPressed: () {
            //   context.go('/signUp/enterInviteCode');
            // },
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
