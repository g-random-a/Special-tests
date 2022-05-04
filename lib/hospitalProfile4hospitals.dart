import 'package:flutter/material.dart';
import 'editHospitalProfile.dart';
import 'addSpecialTests.dart';

class hospitalProfile4Hospitals extends StatelessWidget {
  const hospitalProfile4Hospitals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('first page shown when one registered as hospital'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => addSpecialTest()));
                },
                child: Text('add special tests')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) =>
                              editHospitalProfile()));
                },
                child: Text('edit the hospital profile')),
          ],
        ),
      ),
    );
  }
}
