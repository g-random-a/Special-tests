import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'BottomNavigation.dart';

class Notify extends StatelessWidget {
  List<String> people = <String>["Adam", "Abebe", "Selam", "Abdu", "Beti"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("nofication"),
        actions: [Icon(Icons.notifications)],
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person),
                    radius: 50,
                  ),
                  title: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 10.0, 50.0, 50.0)),
                      Text(
                        "Name",
                      )
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).go('/edit');
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.teal),
                          child: Text(
                            "Approve Request",
                            style: TextStyle(backgroundColor: Colors.teal),
                          )),
                      SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).go('/medical');
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.teal),
                          child: Text("Medical History",
                              style: TextStyle(backgroundColor: Colors.teal)))
                    ],
                  )));
        },
        itemCount: people.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
