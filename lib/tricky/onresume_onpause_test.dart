import 'package:flutter/material.dart';
import 'package:flutter_base/tricky/widget_binding_observer.dart';


class ScreenTest extends StatefulWidget {
  @override
  State<ScreenTest> createState() => _ScreenTestState();
}

class _ScreenTestState extends State<ScreenTest> {
  final AppLifecycleObserver _appLifecycleObserver = AppLifecycleObserver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Lifecycle Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Lifecycle Demo'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(_appLifecycleObserver);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(_appLifecycleObserver);
    super.dispose();
  }
}
