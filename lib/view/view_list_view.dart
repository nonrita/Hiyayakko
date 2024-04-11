import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewListView extends StatelessWidget {
  const ViewListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ViewList')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/home');
              },
              child: const Text('home'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/signIn');
              },
              child: const Text('signIn'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/signUp');
              },
              child: const Text('signUp'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/signUp/userRegistration');
              },
              child: const Text('userRegistration'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/signUp/selectCreateFridgeOrEnterInviteCode');
              },
              child: const Text('selectCreateFridgeOrEnterInviteCode'),
            ),
          ],
        ),
      ),
    );
  }
}
