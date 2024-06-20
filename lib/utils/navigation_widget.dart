import 'package:app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:matchgame/main.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        if (AppNavigator().pages.value.length > 1) {
          AppNavigator().pop();
        }
      },
      child: const NavigationLayer(
        initPage: App(),
        initPath: 'root',
      ),
    );
  }
}
