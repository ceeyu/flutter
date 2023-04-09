import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp()); //main是最高級的function，一個app只能用一次

class AppBarApp extends StatelessWidget {
  //Stateless widget，無狀態組件
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false, //把debug刪掉
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: 聊天室',
      style: optionStyle,
    ),
    Text(
      'Index 1: 葉子',
      style: optionStyle,
    ),
    Text(
      'Index 2: 檢視果實',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        // actions: <Widget>[
        //   TextButton(
        //     style: style,
        //     onPressed: () {},
        //     child: const Text('使用者'),
        //   ),
        //   TextButton(
        //     style: style,
        //     onPressed: () {},
        //     child: const Text('設定'),
        //   ),
        // ],
        title: Text('Not3'),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.person),
          tooltip: '使用者',
          onPressed: () => debugPrint('設定 button is pressed.'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: '設定',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('這是設定')));
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: '聊天室',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.energy_savings_leaf),
            label: '葉子',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: '檢視果實',
            tooltip: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 222, 140),
        onTap: _onItemTapped,
      ),
    );
  }
}
