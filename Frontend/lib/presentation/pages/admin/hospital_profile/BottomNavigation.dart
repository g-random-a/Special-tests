import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int bottom = 0;
  final Views = [
    'hospital_profile',
    'notification',
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        // selectedItemColor: Colors.amber.shade800,
        currentIndex: bottom,
        onTap: (int index) {
          setState(() {
            context.goNamed(Views[index]);
            bottom = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined),
            label: "Notification",
          ),
        ]);
  }
}
