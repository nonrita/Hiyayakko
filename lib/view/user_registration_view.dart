import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hiyayakko/colors.dart';
import 'package:hiyayakko/view/components/background.dart';
import 'package:hiyayakko/view/components/custom_drop_button.dart';
import 'package:hiyayakko/view/components/custom_elevated_button.dart';
import 'package:hiyayakko/view/components/custom_show_dialog.dart';
import 'package:hiyayakko/view/components/custom_text_form_field.dart';
import 'package:hiyayakko/viewModel/user_information_notifier.dart';

class UserRegistrationView extends ConsumerWidget {
  const UserRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userInformation = ref.watch(userInformationNotifierProvider);

    final genderItems = [
      const DropdownMenuItem(
        value: Gender.man,
        child: Text('男性'),
      ),
      const DropdownMenuItem(
        value: Gender.woman,
        child: Text('女性'),
      ),
      const DropdownMenuItem(
        value: Gender.ather,
        child: Text('その他'),
      ),
    ];

    final ageItems = [
      const DropdownMenuItem(
        value: Age.child,
        child: Text('0〜9歳'),
      ),
      const DropdownMenuItem(
        value: Age.teenager,
        child: Text('10代'),
      ),
      const DropdownMenuItem(
        value: Age.twentySomething,
        child: Text('20代'),
      ),
      const DropdownMenuItem(
        value: Age.thirtySomething,
        child: Text('30代'),
      ),
      const DropdownMenuItem(
        value: Age.fortySomething,
        child: Text('40代'),
      ),
      const DropdownMenuItem(
        value: Age.fiftySomething,
        child: Text('50代'),
      ),
      const DropdownMenuItem(
        value: Age.sixtySomething,
        child: Text('60代'),
      ),
      const DropdownMenuItem(
        value: Age.seventySomething,
        child: Text('70代'),
      ),
      const DropdownMenuItem(
        value: Age.eightySomething,
        child: Text('80代'),
      ),
      const DropdownMenuItem(
        value: Age.ninetySomething,
        child: Text('90代'),
      ),
      const DropdownMenuItem(
        value: Age.centenarian,
        child: Text('100歳以上'),
      ),
    ];

    final headerHeight = height * 0.3;
    final header = SizedBox(
      height: headerHeight,
      child: const Align(
        alignment: Alignment(0, 0.5),
        child: Text(
          'ユーザー登録',
          style: TextStyle(
            fontSize: 48,
            color: MyColors.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    final formHeight = height * 0.27;
    final form = SizedBox(
      height: formHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextFormField(
            height: formHeight * 0.25,
            width: width * 0.8,
            labelText: 'ユーザー名',
            hintText: 'ユーザー名を入力してください',
            onChanged: (value) {
              final state = ref.read(userInformationNotifierProvider.notifier);
              state.updateName(value);
            },
          ),
          SizedBox(
            height: formHeight * 0.05,
          ),
          CustomDropButton(
            width: width * 0.8,
            items: genderItems,
            primaryColor: MyColors.primaryColor,
            onChanged: (value) {
              final state = ref.read(userInformationNotifierProvider.notifier);
              state.updateGender(value!);
            },
            value: Gender.man,
          ),
          SizedBox(
            height: formHeight * 0.05,
          ),
          CustomDropButton(
            width: width * 0.8,
            items: ageItems,
            primaryColor: MyColors.primaryColor,
            onChanged: (value) {
              final state = ref.read(userInformationNotifierProvider.notifier);
              state.updateAge(value!);
            },
            value: Age.teenager,
          ),
        ],
      ),
    );

    final footerHeight = height * 0.43;
    final footer = SizedBox(
      height: footerHeight,
      child: Align(
        child: Column(
          children: [
            SizedBox(
              height: footerHeight * 0.2,
            ),
            CustomElevatedButton(
              height: width * 0.15,
              width: width * 0.7,
              text: '登録',
              onPressed: () async {
                print(userInformation);
                if (userInformation.name == null) {
                  customShowDialog(context, '名前が入力されていません');
                } else {
                  context.go('/signUp/selectCreateFridgeOrEnterInviteCode');
                }
              },
              foregroundColor: MyColors.primaryColor,
              backgroundColor: MyColors.bodyColor,
            ),
          ],
        ),
      ),
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
            Background(height: height * 0.43),
            Center(
              child: Column(
                children: [
                  header,
                  form,
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
