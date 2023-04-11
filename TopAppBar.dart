import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp()); //main是最高級的function，一個app只能用一次

class AppBarApp extends StatelessWidget {
  //Stateless widget，無狀態組件
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Action 1'),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Action 2'),
          ),
        ],
      ),
    );
  }
}
