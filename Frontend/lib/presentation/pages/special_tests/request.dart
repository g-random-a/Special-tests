import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/request/bloc/request_updateBloc.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/index.dart';

class Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requests"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: BlocBuilder<requestUpdatebloc, requestUpdateState>(
          builder: (context, state) {
        return ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Test-1",
                            ),
                            Text(
                              "Hospital-1",
                            )
                          ]),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<requestUpdatebloc>(context)
                            .add(requestDeleteRequest(2));
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text(
                        "Cancel Request",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ));
          },
        );
      }),
      bottomNavigationBar: bottombar(),
    );
  }
}
