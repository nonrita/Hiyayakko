import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hiyayakko/colors.dart';
import 'package:hiyayakko/view/components/background.dart';
import 'package:hiyayakko/view/components/custom_elevated_button.dart';
import 'package:hiyayakko/view/components/custom_text_form_field.dart';
import 'package:hiyayakko/viewModel/user_information_notifier.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInformation = ref.watch(userInformationNotifierProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String email = '';
    String password = '';
    String checkPassword = '';

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
          SizedBox(
            height: formHeight * 0.05,
          ),
          CustomTextFormField(
            obscureText: true,
            height: formHeight * 0.25,
            width: width * 0.8,
            labelText: '確認パスワード',
            hintText: '確認パスワードを入力してください',
            onChanged: (value) {
              checkPassword = value;
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
              text: '新規登録',
              onPressed: () async {
                final state =
                    ref.read(userInformationNotifierProvider.notifier);
                isCreateUser(context, email, password, checkPassword, state);
              },
              foregroundColor: MyColors.primaryColor,
              backgroundColor: MyColors.bodyColor,
            ),
            TextButton.icon(
              onPressed: () {
                context.go('/signIn');
              },
              icon: const Icon(
                Icons.play_arrow,
                color: MyColors.bodyColor,
              ),
              label: const Text(
                'ログインはこちら',
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

isCreateUser(BuildContext context, String email, String password,
    String checkPassword, UserInformationNotifier state) async {
  if (password == checkPassword) {
    try {
      // メール/パスワードでユーザー登録
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ユーザー登録に成功した場合
      // チャット画面に遷移＋ログイン画面を破棄
      auth.currentUser?.delete();

      state.updateEmail(email);
      state.updatePassword(password);

      context.go('/signUp/userRegistration');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        /// メールアドレスが既に使用中の場合
        print('すでに使用されているメールアドレスです');
      } else if (e.code == 'weak-password') {
        /// パスワードが弱い場合
        print('パスワードが弱いです');
      } else {
        /// その他エラー
        print('アカウント作成エラー:' + e.toString());
      }
    } catch (e) {
      // ユーザー登録に失敗した場合
    }
  }
}
