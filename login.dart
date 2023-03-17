import 'package:flutter/material.dart';

List<String> titles = <String>[
  '簡介',
  '註冊',
  '登入',
];

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 255, 148, 48), useMaterial3: true),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);//調節淺色
    final Color evenItemColor = colorScheme.primary.withOpacity(0.2);//調節深色
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          
          title: 

            const Text('Not3',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
              ),


          // This check specifies which nested Scrollable's scroll notification
          // should be listened to.
          //
          // When `ThemeData.useMaterial3` is true and scroll view has
          // scrolled underneath the app bar, this updates the app bar
          // background color and elevation.
          //
          // This sets `notification.depth == 1` to listen to the scroll
          // notification from the nested `ListView.builder`.
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar( //Icon AppBar
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.accessibility),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.add_circle),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.account_box),
                text: titles[2],
              ),
            ],
            
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(//簡介
              itemCount: 5, //行數(計數次數)
              itemBuilder: (BuildContext context, int index) { //index是區域變數
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,//設定顏色
                  title: Text('${titles[0]} $index'),
                  
                );
              },
            ),
            ListView.builder(//註冊
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[1]} $index'), //這裡的index是appbar的變數
                );
              },
            ),
            ListView.builder(//登入
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[2]} $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
