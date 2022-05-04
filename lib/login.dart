import 'package:flutter/material.dart';
import 'homePage.dart';
import 'signup.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          // color: Colors.amber[50],
          child: Column(
            children: [
              Text('login page'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) => homePage())));
                  },
                  child: Text('after login form completed to homepage')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) => signupUser())));
                  },
                  child: Text('signup as user')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                signupHospital())));
                  },
                  child: Text('signup as hospital')),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context), child: Text('back'))
            ],
          ),
        ),
      ),
    ));
  }
}
