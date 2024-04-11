import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hiyayakko/colors.dart';
import 'package:hiyayakko/view/components/background.dart';
import 'package:hiyayakko/view/components/custom_elevated_button.dart';
import 'package:hiyayakko/view/components/custom_show_dialog.dart';
import 'package:hiyayakko/view/components/custom_text_form_field.dart';
import 'package:hiyayakko/viewModel/fridge_notifier.dart';
import 'package:hiyayakko/viewModel/user_information_notifier.dart';

class SignInView extends ConsumerWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInformation = ref.watch(userInformationNotifierProvider);
    final fridge = ref.watch(fridgeNotifierProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String email = '';
    String password = '';

    final headerHeight = height * 0.3;
    final header = SizedBox(
      height: headerHeight,
      child: Align(
        alignment: const Alignment(0, 0.5),
        child: Image.asset('images/logo.png'),
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
            labelText: 'メールアドレス',
            hintText: 'メールアドレスを入力してください',
            onChanged: (value) {
              email = value;
            },
          ),
          SizedBox(
            height: formHeight * 0.05,
          ),
          CustomTextFormField(
            obscureText: true,
            height: formHeight * 0.25,
            width: width * 0.8,
            labelText: 'パスワード',
            hintText: 'パスワードを入力してください',
            onChanged: (value) {
              password = value;
            },
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
              text: 'ログイン',
              onPressed: () async {
                final userState =
                    ref.watch(userInformationNotifierProvider.notifier);
                final fridgeState = ref.watch(fridgeNotifierProvider.notifier);
                final db = FirebaseFirestore.instance;
                final FirebaseAuth auth = FirebaseAuth.instance;
                try {
                  // メール/パスワードでログイン
                  await auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  db
                      .collection('users')
                      .doc(auth.currentUser!.uid)
                      .get()
                      .then((value) {
                    userState.updateAll(
                        email,
                        password,
                        value.data()!['name'],
                        value.data()!['gender'],
                        value.data()!['age'],
                        value.data()!['fridgeId']);
                    db
                        .collection('fridge')
                        .doc(value.data()!['fridgeId'])
                        .get()
                        .then((value) {
                      fridgeState.updateAll(
                          value.data()!['name'], value.data()!['inFridge']);
                    });
                  });
                  // ログインに成功した場合
                  // チャット画面に遷移＋ログイン画面を破棄
                  context.push('/home');
                } catch (e) {
                  // ログインに失敗した場合
                  customShowDialog(context, 'ログインに失敗しました');
                }
              },
              foregroundColor: MyColors.primaryColor,
              backgroundColor: MyColors.bodyColor,
            ),
            TextButton.icon(
              onPressed: () {
                context.go('/signUp');
              },
              icon: const Icon(
                Icons.play_arrow,
                color: MyColors.bodyColor,
              ),
              label: const Text(
                '新規登録はこちら',
                style: TextStyle(color: MyColors.bodyColor),
              ),
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
