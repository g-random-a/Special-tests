import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/hospital%20profile/bloc/hospitalProfileEditBloc.dart';

class hospDrawer extends StatelessWidget {
  final String username;
  hospDrawer({Key? key, required this.username}) : super(key: key);

  @override
  Drawer build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          minLeadingWidth: 70.0,
          // tileColor: Colors.white,
          leading: Icon(Icons.person),
          title: Text(username),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[800],
        ),
        Container(
          height: 25.0,
          width: 500.0,
          child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed('CommonUserProfileEdit');
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 21, 188, 171)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Update Account Information",
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 21, 188, 171))),
                ],
              )),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 25.0,
          width: 500.0,
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<HospProfileEditBloc>(context)
                    .add(loadingHospitalEdit());
                GoRouter.of(context).go('/editHospitalProfile');
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 21, 188, 171)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Edit Hospital Profile",
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 21, 188, 171))),
                ],
              )),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 25.0,
          width: 500.0,
          child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/editspecialtest');
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 21, 188, 171)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Edit Special Test",
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 21, 188, 171))),
                ],
              )),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 25.0,
          width: 500.0,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 21, 188, 171)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Logout",
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 21, 188, 171))),
                  Icon(Icons.logout),
                ],
              )),
        ),
      ],
    ));
  }
}
