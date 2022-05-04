import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MaterialApp(
    home: hospital(),
  ));
}

class hospital extends StatelessWidget {
  const hospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return home();
  }
}
