import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/presentation/pages/common/bottom.dart';

class User_profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => User_profile_State();
}

class User_profile_State extends State<User_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('profile'),
        backgroundColor: Color.fromARGB(255, 21, 188, 171),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text("change profile",
                style: TextStyle(
                  color: Color.fromARGB(255, 21, 188, 171),
                )),
          ),
        ],
      )),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    backgroundColor: Color.fromARGB(255, 21, 188, 171),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        ListTile(
                          tileColor: Colors.white,
                          leading: Icon(Icons.person,
                              color: Color.fromARGB(255, 21, 188, 171)),
                          title: Text(
                            'My username',
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.white,
                          leading: Icon(Icons.mail,
                              color: Color.fromARGB(255, 21, 188, 171)),
                          title: Text('My email'),
                        ),
                        ListTile(
                          tileColor: Colors.white,
                          leading: Icon(Icons.edit,
                              color: Color.fromARGB(255, 21, 188, 171)),
                          title: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'Say something abut yourself'),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("change profile",
                        style: TextStyle(
                          color: Color.fromARGB(255, 21, 188, 171),
                        )),
                  ),
                  SizedBox(width: 80),
                ]),
                Divider(
                  height: 60.0,
                  color: Colors.grey[800],
                ),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/medical');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 21, 188, 171)),
                    child: Text("Medical History",
                        style: TextStyle(
                            backgroundColor:
                                Color.fromARGB(255, 21, 188, 171))))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: bottombar(),
    );
  }
}
