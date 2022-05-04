import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Text('welcome page this is login or signup page page'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) => login())));
                },
                child: Text('continue'))
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (BuildContext context) => login()));
            //     },
            //     child: Text('login page')),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (BuildContext context) => signup()));
            //     },
            //     child: Text('signup page'))
          ],
        ),
      ),
    )

        // SafeArea(
        //   child: Container(
        //     margin: EdgeInsets.all(15),
        //     child: Stack(
        //       children: [
        //         Icon(Icons.notifications),
        //         Column(
        //           children: [
        //             Text('hospital name'),
        //             Image(image: AssetImage('assets/tree.jpg')),
        //             Text('address'),
        //             Text('description')
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // // appBar: AppBar(
        // //   leading: Icon(Icons.menu),
        // //   elevation: 0,
        // //   backgroundColor: Color.fromARGB(255, 59, 178, 182),
        // // ),
        // // body: Stack(
        // //   children: [
        // //     SafeArea(
        // //       child: Container(
        // //         margin: EdgeInsets.all(30),
        // //         // color: Colors.black,
        // //         child: Column(
        // //           children: [
        // //             Text(
        // //               'name of the hospital',
        // //               style: TextStyle(fontSize: 40),
        // //             ),
        // //             // SizedBox(
        // //             //   width: 230,
        // //             // ),
        // //             Image(image: AssetImage("assets/tree.jpg")),
        // //             // Positioned(top: 50, right: 20, child: Icon(Icons.notifications)),

        // //             Text('addressssssssssssss'),
        // //             Text('description')
        // //           ],
        // //         ),
        // //       ),
        // //     ),
        // //     Positioned(right: 15, top: 0, child: Icon(Icons.notifications))
        // //   ],
        // // ),
        // floatingActionButton: FloatingActionButton(
        //     child: Text('Add special test'), onPressed: () {}),
        );
  }
}
