import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/auth_bloc.dart';
import 'package:special_tests/application/auth/events/auth_events.dart';
import 'package:special_tests/application/auth/states/auth_state.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/user/entity/user_model.dart' as usr;
import 'package:special_tests/main.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/login/login.dart';
// import 'package:special_tests/services/hh.dart';

class HospitalRegistrationPageTwo extends StatefulWidget {
  HospitalRegistrationPageTwo({Key? key}) : super(key: key);

  @override
  State<HospitalRegistrationPageTwo> createState() =>
      _HospitalRegistrationPageTwoState();
}

class _HospitalRegistrationPageTwoState
    extends State<HospitalRegistrationPageTwo> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final addressController = TextEditingController();

  final descriptionController = TextEditingController();

  var color = AppColor.primaryColor;

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
                    "Hospital",
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
                  key: const Key('HospitalName'),
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Enter Hospital Name",
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Hospital Name is required';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('Address'),
                controller: addressController,
                decoration: const InputDecoration(
                  hintText: "Enter Address",
                  // border: OutlineInputBorder(),
                ),
                validator: (String? lastName) {
                  if (lastName!.isEmpty) {
                    return 'Address is required';
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                key: const Key('Description'),
                controller: descriptionController,
                maxLines: 10,
                minLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  // border:
                  // borderRadius: BorderRadius.circular(25.0),
                  isCollapsed: true,

                  // border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Age can not be empty";
                  } else if (value.length < 18) {
                    return "Age can not be less than 18r";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 55,
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                          color: Colors.teal,
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
                        key: const Key("ToLogin"),
                        onPressed: () {
                          final formValid = formKey.currentState!.validate();
                          if (!formValid) return;

                          final regState =
                              BlocProvider.of<AuthBloc>(context).state;
                          final regBloc = BlocProvider.of<AuthBloc>(context);
                          if (regState is NextBtnPressedState) {
                            usr.User user = regState.user;
                            regBloc.add(RegisterHospEvent(
                                register: RegisterHospital(
                                    user: user,
                                    hospital: Hospital(
                                      hospId: "0",
                                      name: nameController.text,
                                      description: descriptionController.text,
                                      rating: 0,
                                      ratedClients: 0,
                                      address: addressController.text,
                                      image: "image",
                                      requestedTimes: 0,
                                      specialTest: [],
                                    ))));
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
