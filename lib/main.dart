import 'package:flutter/material.dart';
import 'package:flutter_base/isolates.dart';
import 'package:flutter_base/login_page.dart';
import 'package:flutter_base/singleton_example.dart';
import 'package:flutter_base/sqlite/ui/to_do_list_screen.dart';
import 'package:flutter_base/then_vs_await.dart';
import 'package:flutter_base/tricky/onresume_onpause_test.dart';
import 'package:flutter_base/tricky/stateful_inside_stateful.dart';
import 'package:flutter_base/tricky/widget_tree.dart';

import 'async_vs_async*.dart';
import 'keys/global_keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ElevatedButton buildElevatedButton(String buttonText, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(buttonText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildElevatedButton('Then vs Wait', const ThenVsAwait()),
            const SizedBox(height: 10),
            buildElevatedButton('WhenComplete vs Then', const AsyncVsAsyncStar()),
            const SizedBox(height: 10),
            buildElevatedButton('async vs async*', const AsyncVsAsyncStar()),
            const SizedBox(height: 10),
            buildElevatedButton('Isolates', IsolatesExample()),
            const SizedBox(height: 10),
            buildElevatedButton('Login', LoginPage()),
            const SizedBox(height: 10),
            buildElevatedButton('SqFlite To do List', TodoListScreen()),
            const SizedBox(height: 10),
            buildElevatedButton('Singleton class with private Constructor', SingleTonExample()),
            const SizedBox(height: 10),
            buildElevatedButton('State within another stateful', ParentWidget()),
            const SizedBox(height: 10),
            buildElevatedButton('Screen Test', ScreenTest()),
            const SizedBox(height: 10),
            buildElevatedButton('Global Keys', GlobalKeysExample()),
            const SizedBox(height: 10),
            buildElevatedButton('Widget Tree', WidgetTree()),
          ],
        ),
      ),
    );
  }
}
