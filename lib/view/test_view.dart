import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiyayakko/viewModel/user_information_notifier.dart';

class TestView extends ConsumerWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInformation = ref.watch(userInformationNotifierProvider);

    final items = [
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(userInformation.gender),
            TextField(
              onChanged: (newName) {
                final state =
                    ref.read(userInformationNotifierProvider.notifier);
                state.updateName(newName);
              },
            ),
            DropdownButton(
              value: Gender.man,
              items: items,
              onChanged: (newGender) {
                final state =
                    ref.read(userInformationNotifierProvider.notifier);
                state.updateGender(newGender!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint(userInformation.name);
                debugPrint(userInformation.gender);
              },
              child: const Text('入力'),
            ),
          ],
        ),
      ),
    );
  }
}
