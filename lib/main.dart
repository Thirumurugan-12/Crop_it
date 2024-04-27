import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantsense/chat.dart';
import 'chat.dart';
import 'predict.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int _currentPageIndex = 0;

  final _pageOptions = [
    Gemchat(),
    FormW(),
    Text("Page 3"),
  ];

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.deepOrange,
          secondary: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Libro.Ai 📚",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Fredoka",
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: _pageOptions[_currentPageIndex],
        bottomNavigationBar: NavigationBar(
          labelBehavior: labelBehavior,
          selectedIndex: _currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_online),
              label: 'Books',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.map),
              icon: Icon(Icons.map),
              label: 'Maps',
            ),
          ],
        ),
      ),
    );
  }
}
