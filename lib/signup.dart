import 'package:flutter/material.dart';
import 'home.dart';
import 'homepage.dart';
import 'login.dart';

class signupUser extends StatelessWidget {
  const signupUser({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text('this is signupUser page'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContextcontext) => homePage()));
                    },
                    child: Text('after signup home page')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContextcontext) => login()));
                    },
                    child: Text('signin')),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('back'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class signupHospital extends StatelessWidget {
  const signupHospital({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text('this is signupHospital page'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContextcontext) => homePage()));
                    },
                    child: Text('after signup home pagee')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContextcontext) => login()));
                    },
                    child: Text('signin')),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('back'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
