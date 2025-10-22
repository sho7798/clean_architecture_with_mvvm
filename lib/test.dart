import 'package:clean_architecture_mvvm/app/app.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void updateAppState() {
    MyApp.instance.appState = 10;
  }

  void getAppState() {
    debugPrint(MyApp.instance.appState.toString()); //10
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
