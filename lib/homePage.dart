import 'package:flutter/material.dart';
import 'specialTestsHospital.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Text('this is the main page'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) =>
                              specialTestHospital()));
                },
                child: Text('specialTests page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => homePage()));
                },
                child: Text('hospital page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => homePage()));
                },
                child: Text('keep track of your health page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => homePage()));
                },
                child: Text('search via disease page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => homePage()));
                },
                child: Text('ask page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('back'))
          ],
        )),
      ),
    );
  }
}
