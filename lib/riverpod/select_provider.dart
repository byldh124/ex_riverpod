import 'package:ex_riverpod/model/shopping_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
    (ref) => SelectNotifier());

final class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(ShoppingItemModel(
          name: '김치',
          quantity: 2,
          hasBought: false,
          isSpicy: true,
        ));

  void toggleHasBought() {
    /*state = ShoppingItemModel(
      name: state.name,
      quantity: state.quantity,
      hasBought: !state.hasBought,
      isSpicy: state.isSpicy,
    );*/
    state = state.copyWith(hasBought: !state.hasBought);
  }

  void toggleIsSpicy() {
    /*state = ShoppingItemModel(
      name: state.name,
      quantity: state.quantity,
      hasBought: state.hasBought,
      isSpicy: !state.isSpicy,
    );*/

    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
