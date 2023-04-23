import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
static const header = 'GeeksforGeeks';

@override
Widget build(BuildContext context) {
	return const MaterialApp(
	title: header,
	home: MyHomePage(title: header),
	);
}
}

class MyHomePage extends StatelessWidget {
const MyHomePage({Key? key, required this.title}) : super(key: key);

final String title;

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: Text(title),
		backgroundColor: Colors.green,
	),
	body: const Center(
		child: Text(
		'Navigation Drawer Demo',
		style: TextStyle(fontSize: 20),
		),
	),
	drawer: Drawer(
		child: ListView(
		padding: EdgeInsets.zero,
		children: [
			const DrawerHeader(
			decoration: BoxDecoration(
				color: Colors.green,
			),
			child: Text(
				'Navigation Drawer',
				style: TextStyle(fontSize: 20),
			),
			),
			ListTile(
			leading: Icon(Icons.person),
			title: const Text(' My Profile '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: Icon(Icons.book),
			title: const Text(' My Course '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: Icon(Icons.workspace_premium),
			title: const Text(' Go Premium '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: Icon(Icons.video_label),
			title: const Text(' Saved Videos '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: Icon(Icons.edit),
			title: const Text(' Edit Profile '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: Icon(Icons.logout),
			title: const Text('LogOut'),
			onTap: () {
				Navigator.pop(context);
			},
			),
		],
		),
	),
	);
}
}
