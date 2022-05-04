import 'package:flutter/material.dart';

class hospitalProfile extends StatelessWidget {
  const hospitalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('the hospital profile'),
              ElevatedButton(onPressed: () {}, child: Text('request')),
            ],
          ),
        ),
      ),
    );
  }
}
