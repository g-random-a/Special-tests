import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/client%20profile%20edit/bloc/Client_edit_profile_bloc.dart';
import 'package:special_tests/domain/client/entity/client.dart';
// import 'package:special_tests/application/client/bloc/ClientBloc.dart';

class ClientProfileEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClientProfileEditState();
}

class ClientProfileEditState extends State<ClientProfileEdit> {
  final formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  var activerd;
  Client? client;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Edit Client profile'),
          backgroundColor: Color.fromARGB(255, 21, 188, 171),
        ),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Color.fromARGB(255, 21, 188, 171),
            ),
            SizedBox(
              width: 50,
            ),
            Text('Change Profile Picture'),
            Expanded(
              child: BlocConsumer<ClientBloc, ClientState>(
                  listenWhen: (previous, current) =>
                      current is loadClientSuccess,
                  listener: (context, state) {
                    if (state is loadClientSuccess) {
                      client = state.client;
                      firstnameController.value =
                          TextEditingValue(text: state.client.fristName);
                      lastnameController.value =
                          TextEditingValue(text: state.client.lastName);
                      ageController.value =
                          TextEditingValue(text: state.client.age.toString());
                      activerd = state.client.gender;
                    }
                  },
                  builder: (context, state) {
                    if (state is loadingClient) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.teal),
                      );
                    }
                    if (state is loadClientSuccess) {
                      return Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            ListTile(
                              tileColor: Colors.white,
                              title: TextFormField(
                                controller: firstnameController,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person,
                                      color: Color.fromARGB(255, 21, 188, 171)),
                                  hintText: 'First Name',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: null,
                                validator: (String? name) {
                                  if (name == null || name.isEmpty) {
                                    return "Name must not be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            ListTile(
                              tileColor: Colors.white,
                              title: TextFormField(
                                controller: lastnameController,
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: null,
                                validator: (String? name) {
                                  if (name == null || name.isEmpty) {
                                    return "Name must not be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              tileColor: Colors.white,
                              title: TextFormField(
                                controller: ageController,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.location_on,
                                      color: Color.fromARGB(255, 21, 188, 171)),
                                  hintText: 'Age',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: null,
                                validator: (String? age) {
                                  if (age == null || age.isEmpty) {
                                    return "Age must not be empty";
                                  }
                                  final validAge = RegExp("[0-9]");
                                  final correct = validAge.hasMatch(age);
                                  return correct ? null : "Enter a valid price";
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(children: [
                                    Radio(
                                      value: "Female",
                                      groupValue: activerd,
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>((states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return Colors.orange.withOpacity(.32);
                                        }
                                        return Colors.black;
                                      }),
                                      activeColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          activerd = "Female";
                                        });
                                      },
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ]),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Radio(
                                        value: "Male",
                                        groupValue: activerd,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>((states) {
                                          if (states.contains(
                                              MaterialState.disabled)) {
                                            return Colors.orange
                                                .withOpacity(.32);
                                          }
                                          return Colors.teal;
                                        }),
                                        onChanged: (value) {
                                          setState(() {
                                            activerd = "Male";
                                          });
                                        },
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BlocConsumer<ClientBloc, ClientState>(
                                listenWhen: (previous, current) =>
                                    current is updateSuccess,
                                listener: (context, state) {
                                  context.pop();
                                },
                                builder: (context, state) {
                                  Widget button = Text("Update",
                                      style: TextStyle(
                                          backgroundColor: Color.fromARGB(
                                              255, 21, 188, 171)));
                                  if (state is updatingClient) {
                                    button = SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator(
                                          color: Colors.teal,
                                        ));
                                  }
                                  if (state is updateSuccess) {
                                    button = Icon(Icons.check);
                                  }
                                  if (state is updateFailed) {
                                    button = Icon(Icons.refresh_outlined);
                                  }
                                  return ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<ClientBloc>(context).add(
                                          updateClient(
                                              client!.clientId,
                                              Client(
                                                  clientId: client!.clientId,
                                                  fristName:
                                                      firstnameController.text,
                                                  lastName:
                                                      lastnameController.text,
                                                  age: int.parse(
                                                      ageController.text),
                                                  gender: activerd,
                                                  medicalInfo: "")));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 21, 188, 171)),
                                    child: button,
                                  );
                                })
                          ],
                        ),
                      );
                    }
                    return Center(
                        child: Text("Faild to load client please try again"));
                  }),
            )
          ]),
        )));
  }
}
