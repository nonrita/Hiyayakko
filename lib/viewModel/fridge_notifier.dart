import 'package:flutter/material.dart';
import 'package:hiyayakko/model/fridge_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fridge_notifier.g.dart';

@Riverpod(keepAlive: true)
class FridgeNotifier extends _$FridgeNotifier {
  @override
  FridgeModel build() {
    // 最初のデータを準備する
    debugPrint('誰かにwatchされたのでデータを準備します');

    // データが捨てられた時のことを決めておく
    ref.onDispose(() {
      debugPrint('誰にもwatchされなくなったのでデータを捨てます');
    });

    return const FridgeModel();
  }

  void updateFridgeName(String name) {
    state = state.copyWith(name: name);
  }

  void updateAll(String name, Map inFridge) {
    state = state.copyWith(
      name: name,
      inFridge: inFridge,
    );
  }

  getAllAsMap() {
    return {'name': state.name, 'inFridge': state.inFridge};
  }
}
