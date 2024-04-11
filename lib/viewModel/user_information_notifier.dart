import 'package:flutter/material.dart';
import 'package:hiyayakko/model/user_information_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_information_notifier.g.dart';

enum Gender {
  man,
  woman,
  ather,
}

enum Age {
  child,
  teenager,
  twentySomething,
  thirtySomething,
  fortySomething,
  fiftySomething,
  sixtySomething,
  seventySomething,
  eightySomething,
  ninetySomething,
  centenarian,
}

@Riverpod(keepAlive: true)
class UserInformationNotifier extends _$UserInformationNotifier {
  @override
  UserInformationModel build() {
    // 最初のデータを準備する
    debugPrint('誰かにwatchされたのでデータを準備します');

    // データが捨てられた時のことを決めておく
    ref.onDispose(() {
      debugPrint('誰にもwatchされなくなったのでデータを捨てます');
    });

    return const UserInformationModel();
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateFridgeId(String fridgeId) {
    state = state.copyWith(fridgeId: fridgeId);
  }

  void updateAll(String email, String password, String name, String gender,
      String age, String fridgeId) {
    state = state.copyWith(
      email: email,
      password: password,
      name: name,
      gender: gender,
      age: age,
      fridgeId: fridgeId,
    );
  }

  getAllAsMap() {
    return {
      'email': state.email,
      'password': state.password,
      'name': state.name,
      'gender': state.gender,
      'age': state.age,
      'fridgeId': state.fridgeId,
    };
  }

  void updateGender(Gender gender) {
    switch (gender) {
      case Gender.man:
        state = state.copyWith(gender: '男性');
      case Gender.woman:
        state = state.copyWith(gender: '女性');
      case Gender.ather:
        state = state.copyWith(gender: 'その他');
    }
  }

  void updateAge(Age age) {
    switch (age) {
      case Age.child:
        state = state.copyWith(age: '0〜9歳');
      case Age.teenager:
        state = state.copyWith(age: '10代');
      case Age.twentySomething:
        state = state.copyWith(age: '20代');
      case Age.thirtySomething:
        state = state.copyWith(age: '30代');
      case Age.fortySomething:
        state = state.copyWith(age: '40代');
      case Age.fiftySomething:
        state = state.copyWith(age: '50代');
      case Age.sixtySomething:
        state = state.copyWith(age: '60代');
      case Age.seventySomething:
        state = state.copyWith(age: '70代');
      case Age.ninetySomething:
        state = state.copyWith(age: '80代');
      case Age.eightySomething:
        state = state.copyWith(age: '90代');
      case Age.centenarian:
        state = state.copyWith(age: '100歳以上');
    }
  }
}
