import 'package:flutter/material.dart';
import 'package:mexican_food/LOGIN/login.dart';
import 'package:mexican_food/card.dart';
import 'package:mexican_food/clock2.dart';
import 'package:mexican_food/kesan_pesan.dart';
import 'package:mexican_food/konversi.dart';
import 'package:mexican_food/listFood.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({Key? key}) : super(key: key);

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Business',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: Business',
      style: optionStyle,
    ),
    Text(
      'Index 3: Business',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => ListFood()),
          ModalRoute.withName('/')
      );
    }
    if (_selectedIndex == 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Clock2()),
          ModalRoute.withName('/')
      );
    }
    if (_selectedIndex == 2) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Konversi()),
          ModalRoute.withName('/')
      );
    }
    if (_selectedIndex == 3) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => KesanPesan()),
          ModalRoute.withName('/')
      );
    }
    if (_selectedIndex == 4) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginForm()),
          ModalRoute.withName('/')
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color(0xFF282828),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Jam',
          backgroundColor: Color(0xFF282828),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Konversi',
          backgroundColor: Color(0xFF282828),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger_outline),
          label: 'Kesan dan Pesan',
          backgroundColor: Color(0xFF282828),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Keluar',
          backgroundColor: Color(0xFF282828),
        )
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}
