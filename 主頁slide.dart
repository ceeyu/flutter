// ignore: file_names
//檔案匯入
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/ChatPage.dart';
import 'package:flutter_project/screens/FruitsPage.dart';
import 'package:flutter_project/screens/LeafPage.dart';
import 'package:flutter_project/AnimationBottomBar.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int pageIndex = 0;
  List<Widget> pageItem = [];

  @override
  void initState() {
    super.initState();
    //PageItem代表三頁項目
    pageItem = [const ChatPage(), const LeafPage(), const FruitsPage()];
  }

  final List<BarItemData> barItems = [
    BarItemData(
        "聊天室", Icons.accessibility, const Color.fromARGB(212, 0, 255, 0)),
    BarItemData(
        "葉子", Icons.energy_savings_leaf, const Color.fromARGB(212, 0, 255, 0)),
    BarItemData("檢視果實", Icons.feed, const Color.fromARGB(212, 0, 255, 0))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold //下方列
        (
      appBar: AppBar(
        title: const Center(child: Text('Not3')),
        backgroundColor: Colors.green,
        elevation: 0.0, //陰影
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('滑開:Where is Title',
                  style: TextStyle(
                    fontFamily: 'Raleway', //套用字形
                  )),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('使用者'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('設定'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pop(context); //更新state並關閉drawer
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: pageIndex,
        children: pageItem,
      ),
      bottomNavigationBar: AnimationBottomBar(
        barItemsData: barItems,
        barStyle: BarStyle(
            fontSize: 20.0, fontWeight: FontWeight.w400, iconSize: 30.0),
        changePageIndex: (int index) {
          setState(() {
            pageIndex = index; //跟隨不同頁面切換
          });
        },
      ),
    );
  }
}
