import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_tests/presentation/pages/index.dart';

class req {
  String Title;
  Icon icon;
  req(this.Title, this.icon);
}

class userNotification extends StatelessWidget {
  // final List<Request> notification;
  // userNotification({required this.notification})

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Notification")),
        body: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext, index) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                      tileColor: Colors.teal[100],
                      leading: Icon(Icons.check,
                          color: Color.fromARGB(255, 21, 188, 171)),
                      title: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Text("Test-1"),
                              Text("Hospital -1"),
                            ],
                          ))));
            }));
  }
}
