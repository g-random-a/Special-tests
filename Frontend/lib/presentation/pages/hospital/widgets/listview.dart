import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';

class testsList extends StatelessWidget {
  List<SpecialTest> tests;
  testsList({Key? key, required this.tests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext, index) {
        return Column(
          children: [
            Container(
              height: 50.0,
              child: Card(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 17, 84, 113),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () =>
                      GoRouter.of(context).push('/editSpecialTest'),
                  child: Text(
                    tests[index].name,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.0),
          ],
        );
      },
      itemCount: tests.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
    );
  }
}
