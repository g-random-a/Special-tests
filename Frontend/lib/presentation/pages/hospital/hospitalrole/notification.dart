import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/request/bloc/request_updateBloc.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/index.dart';

class Notify extends StatelessWidget {
  // List<String> people = <String>["Adam", "Abebe", "Selam", "Abdu", "Beti"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         key: const Key("nn"),
        title: Text("Nofications"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
            child: Column(
              children: [
                Row(
                 
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(Icons.person),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Name",
                          key: const Key("btn2"),
                        ),
                        Text(
                          "Test-1",
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).pushNamed('medical');
                        },
                        child: Text("Medical History",
                            style: TextStyle(color: AppColor.primaryColor)))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                BlocBuilder<requestUpdatebloc, requestUpdateState>(
                    builder: (context, state) {
                  Widget error = SizedBox(
                    width: 1,
                  );
                  if (state is requestUpdateLoading) {
                    return Container(
                      child: const CircularProgressIndicator(
                          color: AppColor.primaryColor),
                    );
                  }
                  if (state is requestUpdateOperationFailure) {
                    error = Text(
                      "Error Please try again",
                      style: TextStyle(color: Colors.red, fontSize: 11),
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          key: const Key("nn"),
                          onPressed: () {
                            BlocProvider.of<requestUpdatebloc>(context).add(
                                const requestupdateRequest(
                                    requestId: 1, status: "APPROVE"));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColor.primaryColor),
                          child: const Text(
                            "Approve",
                            key: const Key("kj"),
                            style: TextStyle(
                                backgroundColor: AppColor.primaryColor),
                          )),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<requestUpdatebloc>(context).add(
                                const requestupdateRequest(
                                    requestId: 1, status: "DECLINE"));
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: const Text(
                            "Decline",
                            style: TextStyle(color: AppColor.secondaryColor),
                          )),
                      error
                    ],
                  );
                }),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
