import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HospitalEditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit profile'),
        backgroundColor: Color.fromARGB(255, 21, 188, 171),
        actions: [],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
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
              Text('change profile'),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    ListTile(
                      tileColor: Colors.white,
                      leading: Icon(Icons.person,
                          color: Color.fromARGB(255, 21, 188, 171)),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: null,
                      ),
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      leading: Icon(Icons.location_on,
                          color: Color.fromARGB(255, 21, 188, 171)),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'location',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: null,
                      ),
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      leading: Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 21, 188, 171),
                      ),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Descrpition',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: null,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 188, 171)),
                      child: Text("Update",
                          style: TextStyle(
                              backgroundColor:
                                  Color.fromARGB(255, 21, 188, 171))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
