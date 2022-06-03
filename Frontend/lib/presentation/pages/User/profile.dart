import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/presentation/pages/index.dart';

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
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 21, 188, 171),
      ),
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            minLeadingWidth: 70.0,
            // tileColor: Colors.white,
            leading: Icon(Icons.person),
            title: Text('My username'),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[800],
          ),
          // Container(
          //   height: 25.0,
          //   width: 500.0,
          //   child: ElevatedButton(
          //       onPressed: () {
          //         // GoRouter.of(context).go('/editspecialtest');
          //       },
          //       style: ElevatedButton.styleFrom(
          //           primary: Color.fromARGB(255, 21, 188, 171)),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Text("Change Profile",
          //               style: TextStyle(
          //                   backgroundColor:
          //                       Color.fromARGB(255, 21, 188, 171))),
          //         ],
          //       )),
          // ),
          SizedBox(height: 20.0),
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
                            backgroundColor:
                                Color.fromARGB(255, 21, 188, 171))),
                  ], 
                )), 
          ),
          Container(
            height: 25.0,
            width: 500.0,
            child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed('editProfile');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 188, 171)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Edit Profile",
                        style: TextStyle(
                            backgroundColor:
                                Color.fromARGB(255, 21, 188, 171))),
                  ], 
                )), 
          ),
          SizedBox(height: 20.0),
          Container(
            height: 25.0,
            width: 500.0,
            child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed('medicalForm');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 188, 171)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Medical Form",
                        style: TextStyle(
                            backgroundColor:
                                Color.fromARGB(255, 21, 188, 171))),
                  ],
                )),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 25.0,
            width: 500.0,
            child: ElevatedButton(
                onPressed: () {Navigator.pushNamedAndRemoveUntil(context, 'client', (Route<dynamic> route) => false);},
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 188, 171)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Logout",
                        style: TextStyle(
                            backgroundColor:
                                Color.fromARGB(255, 21, 188, 171))),
                    Icon(Icons.logout),
                  ],)),
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
