import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Center(
          child: Container(
            // color: Colors.teal,
            width: 500,
            height: 500,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Text(
                  "Edit Your Profile",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Change Your profile Picture"),
                ),
                SizedBox(height: 10),
                TextField(
                  cursorColor: Colors.black,
                  cursorRadius: Radius.circular(10.0),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.teal[50]),
                ),
                SizedBox(height: 10),
                TextField(
                  cursorColor: Colors.black,
                  cursorRadius: Radius.circular(10.0),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Age",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.teal[50]),
                ),
                SizedBox(height: 10),
                TextField(
                  cursorColor: Colors.black,
                  cursorRadius: Radius.circular(10.0),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.teal[50]),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  key:const Key("btn1"),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                  child: Text(
                    "Update",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
