import 'package:flutter/material.dart';

class editSpecialTests extends StatefulWidget {
  @override
  State<editSpecialTests> createState() => editSpecialTestsState();
}

class editSpecialTestsState extends State<editSpecialTests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'name'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Price',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'price'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'description'),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Delete',
                          style:
                              TextStyle(color: Color.fromARGB(255, 34, 10, 8)),
                        ),
                        content: const Text(
                            'Do you want to delete this special test?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) => setState(() {}));
                            },
                            child: const Text('Delete'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'cancel'),
                            child: const Text('cancel'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Delete')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.check),
      ),
    );
  }
}
