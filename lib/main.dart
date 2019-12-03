import 'package:flutter/material.dart';
import 'package:flutter_pratice1/ui/main/main_screen.dart';
import 'package:flutter_pratice1/ui/my/mypage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
  // BottomNaviationBar selected index
  int _selectedIndex = 0;

  static List<Widget> _pageList = <Widget>[
    MainPage(),
    Text("이용내역 !!!!"),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _buildNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('홈'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          title: Text('이용내역'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          title: Text('내정보'),
        )
      ],
      currentIndex: _selectedIndex,
      //selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  Visibility _buildFloatingActionButton() {
    return Visibility(
      visible: _selectedIndex == 0 ? true : false,
      child: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.filter_center_focus,
          color: Colors.green),
          //shape: Border.all(style: BorderStyle.none),
          backgroundColor: Colors.white,
          //hoverColor: Colors.blue,
          //splashColor: Colors.yellow,
          mini: true,
        ),
      ),
    );
  }

}
