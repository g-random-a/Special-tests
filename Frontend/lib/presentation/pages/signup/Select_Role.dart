import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/presentation/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/presentation/Common/Color.dart';

import '../../../application/auth/bloc/role_bloc.dart';

class SelectRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final role = BlocProvider.of<RoleBloc>(context);
    return Scaffold(body:
        BlocBuilder<RoleBloc, RoleState>(builder: (_, RoleState roleState) {
      return Column(children: [
        Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Stack(children: [
              ClipPath(
                child: Container(
                  color: AppColor.secondaryColor,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(child: Image.asset("assets/logo.png")),
              ),
            ]),
            InkWell(
              // key: Key('btn4'),
              onTap: () {
                role.add(hospitalRole());
                context.pushNamed('SignUp');
                print("hospital Role");
              },
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                height: 70,
                width: 350,
                child: Card(
                    shadowColor: AppColor.secondaryColor,
                    color: Colors.teal,
                    elevation: 10,
                    child: Center(
                        child: Text("Hospital",
                            style: TextStyle(
                              color: AppColor.secondaryColor,
                              fontSize: 30,
                              // fontFamily:
                            )))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                role.add(clientRole());
                context.pushNamed('Signup');
                print("client Role");
              },
              child: Container(
                height: 70,
                width: 350,
                child: Card(
                  color: AppColor.secondaryColor,
                  elevation: 2,
                  child: Center(
                      child: Text("User",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 30,
                            // fontFamily:
                          ))),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account? "),
            InkWell(
              child: Text("Login",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                context.pushNamed('login');
              },
            )
          ],
        )
      ]);
    }));
  }
}
