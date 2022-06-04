import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/user_status_bloc.dart';
import 'package:special_tests/application/auth/states/status_state.dart';
import 'package:special_tests/application/hospital%20profile/bloc/hospitalBloc.dart';
import 'package:special_tests/application/hospital%20tests/bloc/hospitalTestsBloc.dart';
import 'package:special_tests/application/specialTest/bloc/specialTestBloc.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/hospital/widgets/drawer.dart';
import 'package:special_tests/presentation/pages/hospital/widgets/listview.dart';
import 'package:special_tests/presentation/pages/index.dart';

class Hospital_Profile extends StatelessWidget {
  // List<String> people = <String>["Adam", "Abebe", "Selam", "Abdu", "Beti"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStatusBloc, AuthStatusState>(
        builder: (context, state) {
      AppBar appbar = AppBar(
        
        title: Text('Hospital Profile'),
        backgroundColor: Color.fromARGB(255, 21, 188, 171),
      );
      Widget button = SizedBox();
      Widget navBar = bottombar();
      Drawer? drawer = null;
      final authState = BlocProvider.of<AuthStatusBloc>(context).state;
      if (authState is AuthenticatedState) {
        User user = authState.user;
        if (user.role == "HOSPITAL") {
          appbar = AppBar(
            title: Text('Profile'),
            backgroundColor: Color.fromARGB(255, 21, 188, 171),
          );
          drawer = hospDrawer(username: authState.user.username) as Drawer?;
          navBar = BottomNavigation();
          button = TextButton(
              onPressed: () {
                context.pushNamed('editAddTests');
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text("Add Special Test"),
                ],
              ));
        }
      }
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar,
        drawer: drawer,
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, color: Colors.white),
                    backgroundColor: Color.fromARGB(255, 21, 188, 171),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: BlocBuilder<hospitalBloc, HospitalState>(
                        builder: (context, state) {
                      if (state is HospitalOperationSuccess) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.hospital.name,
                              style: TextStyle(fontSize: 30.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                              ],
                            ),
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              state.hospital.address,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        );
                      }
                      if (state is HospitalLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        );
                      }
                      return Center(
                        child: Text("can not load profile"),
                      );
                    }),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Divider(height: 20, color: Colors.grey[800]),
            SizedBox(height: 20.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Available Special Tests",
                  

                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  // style: TextStyle(color: Colors.teal),
                ),
                button
              ],
            ),
            SizedBox(height: 30.0),
            BlocBuilder<hospitalTestsBloc, HospitalTestsState>(
                builder: (context, state) {
              Widget testswidget = SizedBox();
              if (state is HospitalTestsLoading) {
                testswidget = CircularProgressIndicator(
                  color: Colors.teal,
                );
              } else if (state is HospitalTestsLoadSuccess) {
                List<SpecialTest> tests = state.tests;
                if (tests.isEmpty) {
                  testswidget =
                      Center(child: Text("No Special Tests Available"));
                } else {
                  testswidget = testsList(tests: tests);
                }
              }
              return Expanded(
                child: testswidget,
              );
            }),
          ],
        ),
        bottomNavigationBar: navBar,
      );
    });
  }
}
