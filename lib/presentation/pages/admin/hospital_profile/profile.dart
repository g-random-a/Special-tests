import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'BottomNavigation.dart';

class Hospital_Profile extends StatelessWidget {
  List<String> people = <String>["Adam", "Abebe", "Selam", "Abdu", "Beti"];
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
          Container(
            height: 25.0,
            width: 500.0,
            child: ElevatedButton(
                onPressed: () {
                  // GoRouter.of(context).go('/editspecialtest');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 188, 171)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Change Profile",
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
                onPressed: () {},
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
                  ],
                )),
          ),
        ],
      )),
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
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        width: 20.0,
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        title: Text(
                          'Hospital Name',
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20.0),
                          const SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          ),
                        ],
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        leading: Icon(Icons.location_on),
                        title: Text(
                          'Location',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Divider(height: 20, color: Colors.grey[800]),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(right: 230),
            child: Text(
              "Available Special Tests",

              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              // style: TextStyle(color: Colors.teal),
            ),
          ),
          SizedBox(height: 30.0),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext, index) {
                return Column(
                  children: [
                    Container(
                      width: 500.0,
                      height: 70.0,
                      child: Card(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 17, 84, 113),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () =>
                              GoRouter.of(context).go('/editSpecialTest'),
                          child: Text(
                            "Fertilty test",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                  ],
                );
              },
              itemCount: people.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).go('/editSpecialTest'),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
