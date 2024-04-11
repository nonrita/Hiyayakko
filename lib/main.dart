import 'package:firebase_core/firebase_core.dart';
import 'package:hiyayakko/view/create_fridge_view.dart';
import 'package:hiyayakko/view/enter_Invite_code_view.dart';
import 'package:hiyayakko/view/select_create_fridge_or_enterInvite_code_view.dart';
import 'package:hiyayakko/view/user_registration_view.dart';
import 'package:hiyayakko/view/view_list_view.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hiyayakko/view/home_view.dart';
import 'package:hiyayakko/view/sign_in_view.dart';
import 'package:hiyayakko/view/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final app = MyApp();
  final scope = ProviderScope(child: app);
  runApp(scope);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ViewListView(),
      ),
      GoRoute(
        path: '/signIn',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/signUp/userRegistration',
        builder: (context, state) => const UserRegistrationView(),
      ),
      GoRoute(
        path: '/signUp/selectCreateFridgeOrEnterInviteCode',
        builder: (context, state) => const SelectCreateFridgeOrEnterInviteCodeView(),
      ),
      GoRoute(
        path: '/signUp/createFridge',
        builder: (context, state) => const CreateFridgeView(),
      ),
      GoRoute(
        path: '/signUp/enterInviteCode',
        builder: (context, state) => const EnterInviteCodeView(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
