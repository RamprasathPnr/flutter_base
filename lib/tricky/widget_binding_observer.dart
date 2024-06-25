import 'package:flutter/widgets.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App is resumed
      print('App is resumed');
    } else if (state == AppLifecycleState.paused) {
      // App is paused
      print('App is paused');
    }
  }
}
