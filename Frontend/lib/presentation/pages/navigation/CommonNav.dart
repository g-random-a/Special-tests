import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class bottombar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => bottombarState();
}

class bottombarState extends State<bottombar> {
  int bottom = 0;
  final View = [
    'home',
    'request',
    'userProfile',
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.amber.shade800,
        currentIndex: bottom,
        onTap: (int index) {
          setState(() {
            context.goNamed(View[index]);
            bottom = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined),
            label: "Request",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Profile",
          )
        ]);
  }
}
