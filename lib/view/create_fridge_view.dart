import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hiyayakko/colors.dart';
import 'package:hiyayakko/view/components/background.dart';
import 'package:hiyayakko/view/components/custom_elevated_button.dart';
import 'package:hiyayakko/view/components/custom_text_form_field.dart';
import 'package:hiyayakko/viewModel/fridge_notifier.dart';
import 'package:hiyayakko/viewModel/user_information_notifier.dart';
import 'package:uuid/uuid.dart';

class CreateFridgeView extends ConsumerWidget {
  const CreateFridgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInformation = ref.watch(userInformationNotifierProvider);
    final fridge = ref.watch(fridgeNotifierProvider);
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
            '冷蔵庫作成',
            style: TextStyle(
              fontSize: 32,
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            '冷蔵庫名を入力してください',
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
            labelText: '冷蔵庫名',
            hintText: '冷蔵庫名を入力してください',
            onChanged: (value) {
              final state = ref.watch(fridgeNotifierProvider.notifier);
              state.updateFridgeName(value);
            },
          ),
          SizedBox(
            height: mainHeight * 0.1,
          ),
          CustomElevatedButton(
            height: width * 0.15,
            width: width * 0.7,
            text: '作成',
            onPressed: () async {
              final userState =
                  ref.watch(userInformationNotifierProvider.notifier);
              final fridgeState = ref.watch(fridgeNotifierProvider.notifier);
              final db = FirebaseFirestore.instance;
              final FirebaseAuth auth = FirebaseAuth.instance;

              try {
                await auth.createUserWithEmailAndPassword(
                  email: userInformation.email,
                  password: userInformation.password,
                );

                String refId = const Uuid().v4();
                await db
                    .collection('fridge')
                    .doc(refId)
                    .set(fridgeState.getAllAsMap());

                userState.updateFridgeId(refId);

                await db
                    .collection('users')
                    .doc(auth.currentUser?.uid)
                    .set(userState.getAllAsMap());
                context.go('/home');
              } catch (e) {
                print('Error : $e');
              }
            },
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
