import 'package:flutter/material.dart';
import 'viewProfile.dart';

class AllHospitals extends StatelessWidget {
  const AllHospitals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('list of available hospitals'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => hospitalProfile()));
                },
                child: Text('1 hospital profile page')),
          ],
        ),
      ),
    );
  }
}
