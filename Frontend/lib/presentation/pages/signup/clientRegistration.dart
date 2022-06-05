import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/auth_bloc.dart';
import 'package:special_tests/application/auth/events/auth_events.dart';
import 'package:special_tests/application/auth/states/auth_state.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/user/entity/user_model.dart' as usr;
import 'package:special_tests/main.dart';
import 'package:special_tests/presentation/pages/login/login.dart';
// import 'package:special_tests/presentation/pages/index.dart';
// import 'package:special_tests/services/hh.dart';

class ClientRegistrationPageTwo extends StatefulWidget {
  ClientRegistrationPageTwo({Key? key}) : super(key: key);

  @override
  State<ClientRegistrationPageTwo> createState() =>
      _ClientRegistrationPageTwoState();
}

class _ClientRegistrationPageTwoState extends State<ClientRegistrationPageTwo> {
  final formKey = GlobalKey<FormState>();

  final fristNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final ageController = TextEditingController();

  // final confPassController = TextEditingController();
  var confirmpass;

  var activerd = "Male";
  var color = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Client",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Registration",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(" 2/2",
                    style: TextStyle(fontSize: 20, color: Colors.black))
              ]),
              const SizedBox(height: 40),
              TextFormField(
                  key: const Key('CFirstName'),
                  controller: fristNameController,
                  decoration: const InputDecoration(
                    hintText: "Enter Frist Name",
                  ),
                  validator: (String? value) {
                    String pattern = r'(^[a-zA-Z ]*$)';
                    RegExp regExp = RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Frist Name is required';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Frist Name must be a-z and A-Z';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('CLastName'),
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: "Enter Last Name",
                  // border: OutlineInputBorder(),
                ),
                validator: (String? lastName) {
                  String pattern = r'(^[a-zA-Z ]*$)';
                  RegExp regExp = RegExp(pattern);
                  if (lastName!.isEmpty) {
                    return 'Last Name is required';
                  } else if (!regExp.hasMatch(lastName)) {
                    return 'Last Name must be a-z and A-Z';
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  hintText: "enter Age",
                  // border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  confirmpass = value;
                  if (value == null || value.isEmpty) {
                    return "Age can not be empty";
                  } else if (value.length < 8) {
                    return "Age can not be less than 18r";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    key: const Key("Cont"),
                    child: Row(children: [
                      Radio(
                        value: "Female",
                        groupValue: activerd,
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
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
                            fontWeight: FontWeight.bold, fontSize: 18),
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
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.orange.withOpacity(.32);
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
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 55,
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.teal,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listenWhen: (previous, current) {
                    return current is RegisterSuccess;
                  },
                  listener: (_, AuthState state) {
                    context.pushNamed("login");
                  },
                  builder: (_, AuthState state) {
                    Widget buttonChild = const Text("Finish");
                    if (state is Registering) {
                      buttonChild = const SizedBox(
                        height: 10,
                        width: 10,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    if (state is RegisterSuccess) {
                      buttonChild = Row(children: [
                        Text("SignUp Successful",
                            style: TextStyle(color: Colors.teal, fontSize: 17)),
                        SizedBox(width: 5),
                        Icon(
                          Icons.check_circle,
                          color: Colors.teal,
                        )
                      ]);
                    }
                    if (state is RegisterError) {
                      buttonChild = Column(children: [
                        Text("Try Again"),
                        SizedBox(width: 5),
                        // Text(state.errorMessage),
                      ]);
                    }
                    return ElevatedButton(
                        key: const Key("ElevatedBtn"),
                        onPressed: () {
                          final formValid = formKey.currentState!.validate();
                          if (!formValid) return;

                          final regState =
                              BlocProvider.of<AuthBloc>(context).state;
                          final regBloc = BlocProvider.of<AuthBloc>(context);
                          if (regState is NextBtnPressedState) {
                            usr.User user = regState.user;
                            regBloc.add(RegisterclientEvent(
                                register: RegisterClient(
                                    user: user,
                                    client: Client(
                                        clientId: "0",
                                        fristName: fristNameController.text,
                                        lastName: lastNameController.text,
                                        age: int.parse(ageController.text),
                                        gender: activerd,
                                        medicalInfo: ""))));
                          }
                        },
                        child: buttonChild);
                  },
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
