import 'package:flutter/material.dart';

class AppBottomsheet {
  Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25))),
        builder: (_) {
          return widget;
        });
  }
}
