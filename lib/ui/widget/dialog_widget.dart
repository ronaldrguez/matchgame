import 'package:app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';

class DialogService {
  static showInfo (context, {required String title, required Widget content,}) {
    AppNavigator().showDialog(barrierDismissible: false, builder: (context) => AlertDialog(
      title: Text(title),
      content: content,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {
              AppNavigator().pop();
            }, child: const Text('Accept')),
          ],
        )
      ],
    ));
  }

  static chooseCategory (BuildContext context, {required String title, required Widget content,required VoidCallback onAccepted}) {
    AppNavigator().showDialog(barrierDismissible: false, builder: (context) => AlertDialog(
      title: Text(title),
      content: content,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        OutlinedButton(onPressed: () => AppNavigator().pop(), child: const Text('Cancel')),
        ElevatedButton(onPressed: () {
          AppNavigator().pop();
          onAccepted.call();
        }, child: const Text('Accept')),
      ],
    ));
  }
}