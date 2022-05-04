import 'package:flutter/material.dart';
import 'viewProfile.dart';

class specialTestHospital extends StatelessWidget {
  const specialTestHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text('list of hospitals having the chosen special test'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContextcontext) =>
                                  hospitalProfile()));
                    },
                    child: Text('the hospital page')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
