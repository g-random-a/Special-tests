import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/specialTest/bloc/specialTestDetailBloc.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/presentation/pages/index.dart';

class testAvailable extends StatelessWidget {
  final Hospital hosp;
  final SpecialTest test;
  testAvailable(this.test, this.hosp);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          BlocProvider.of<TestDetailBloc>(context)
              .add(loadTestDetail(test: test, hosp: hosp));
          context.goNamed('testDetail', extra: test);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          color: Colors.tealAccent),
                    ),
                    Text(
                      test.name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
