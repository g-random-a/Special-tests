import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/role_bloc.dart';
import 'package:special_tests/application/auth/bloc/user_status_bloc.dart';
import 'package:special_tests/application/auth/events/auth_events.dart';
import 'package:special_tests/application/auth/states/auth_state.dart';
import 'package:special_tests/application/client%20profile%20edit/bloc/Client_edit_profile_bloc.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/user/entity/user_model.dart' as usr;
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/index.dart';
import 'package:special_tests/presentation/pages/signup/clientRegistration.dart';
import 'package:special_tests/presentation/pages/signup/hospitalRegistration.dart';

import '../../../application/auth/bloc/auth_bloc.dart';

// ignore: must_be_immutable
class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool visible = false;
  bool confvisible = false;
  final formKey = GlobalKey<FormState>();

  final fNameController = TextEditingController();

  final lNameController = TextEditingController();

  final emilController = TextEditingController();

  final passwordController = TextEditingController();

  final confPassController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var confirmpass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Special Test",
                style: TextStyle(
                    fontSize: 30,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: fNameController,
                validator: (String? value) {
                  String pattern = r'(^[a-zA-Z0-9 ]*$)';
                  RegExp regExp = RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Name is required';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Name must be a-z and A-Z';
                  }
                  return null;
                },
                scrollPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                keyboardType: TextInputType.emailAddress,
                // cursorWidth: 5,
                cursorRadius: Radius.circular(30),
                cursorColor: AppColor.primaryColor,
                decoration: const InputDecoration(
                  labelText: "Enter Name",
                  labelStyle: TextStyle(color: AppColor.primaryColor),
                  floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
                  helperMaxLines: 1,
                  hintText: "Enter Name",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  hintMaxLines: 1,
                  errorText: null,
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColor.primaryColor,
                  ),
                  focusColor: AppColor.primaryColor,
                  hoverColor: AppColor.primaryColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 15,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emilController,
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return "Email must not be empty";
                  }
                  final validEmail = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
                  final correct = validEmail.hasMatch(email);

                  return correct ? null : "Enter a valid email";
                },
                scrollPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                keyboardType: TextInputType.emailAddress,
                // cursorWidth: 5,
                cursorRadius: Radius.circular(30),
                cursorColor: AppColor.primaryColor,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  labelStyle: TextStyle(color: AppColor.primaryColor),
                  floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
                  helperMaxLines: 1,
                  hintText: "Enter Email Address",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  hintMaxLines: 1,
                  errorText: null,
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: AppColor.primaryColor,
                  ),
                  focusColor: AppColor.primaryColor,
                  hoverColor: AppColor.primaryColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 15,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: !visible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter New Password ";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters long";
                  }
                  return null;
                },
                // cursorWidth: 5,
                cursorRadius: Radius.circular(30),
                cursorColor: AppColor.primaryColor,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: AppColor.primaryColor),
                  floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
                  helperMaxLines: 1,
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  hintMaxLines: 1,
                  errorText: null,
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  prefixIcon: Icon(
                    Icons.key_rounded,
                    color: AppColor.primaryColor,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      child: visible
                          ? Icon(Icons.visibility_off_outlined,
                              color: AppColor.primaryColor)
                          : Icon(Icons.remove_red_eye, color: Colors.grey)),
                  focusColor: AppColor.primaryColor,
                  hoverColor: AppColor.primaryColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 3,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.secondaryColor,
                      width: 3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: confPassController,
                obscureText: !confvisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please ReEnter Password ";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters long";
                  }
                  return null;
                },
                // cursorWidth: 5,
                cursorRadius: Radius.circular(30),
                cursorColor: AppColor.primaryColor,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: AppColor.primaryColor),
                  floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
                  helperMaxLines: 1,
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  hintMaxLines: 1,
                  errorText: null,
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  prefixIcon: Icon(
                    Icons.key_rounded,
                    color: AppColor.primaryColor,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          confvisible = !confvisible;
                        });
                      },
                      child: confvisible
                          ? Icon(Icons.visibility_off_outlined,
                              color: AppColor.primaryColor)
                          : Icon(Icons.remove_red_eye, color: Colors.grey)),
                  focusColor: AppColor.primaryColor,
                  hoverColor: AppColor.primaryColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 3,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.secondaryColor,
                      width: 3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocConsumer<AuthBloc, AuthState>(
                listenWhen: (previous, current) {
                  return current is NextBtnPressedState;
                },
                listener: (_, AuthState state) {
                  final st = BlocProvider.of<RoleBloc>(context);
                  if (st.state is hospitalState) {
                    print("hospital State");
                    context.pushNamed("hospitalSignup");
                  } else if (st.state is clientState) {
                    print("client");
                    context.pushNamed("clientSignup");
                  } else {
                    print("none");
                  }
                },
                builder: (_, AuthState state) {
                  Widget buttonChild = const Text("Sign Up",
                      style: TextStyle(
                          color: AppColor.secondaryColor, fontSize: 20));
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
                      )
                    ]);
                  }
                  if (state is RegisterError) {
                    buttonChild = Column(children: [
                      Text("SignUp Failure"),
                      SizedBox(width: 5),
                      Text(state.errorMessage),
                    ]);
                  }
                  return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.primaryColor),
                        elevation: MaterialStateProperty.all(10)),
                    onPressed: () {
                      final formValid = formKey.currentState!.validate();
                      if (!formValid) return;

                      final regBloc = BlocProvider.of<AuthBloc>(context);
                      regBloc.add(NextBtnPressedEvent(
                          user: usr.User(
                              id: "",
                              username: fNameController.text,
                              email: lNameController.text,
                              password: passwordController.text,
                              role: emilController.text)));
                    },
                    child: buttonChild,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:special_tests/application/client/bloc/ClientBloc.dart';
// import 'package:go_router/go_router.dart';

// class SignUp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ClientBloc, ClientState>(
//         builder: (_, ClientState state) {
//       return Scaffold(
//         body: ElevatedButton(
//             onPressed: () {
//               if (state is userState) {
//                 context.goNamed('home');
//               }
//               if (state is hospitalState) {
//                 context.goNamed('hospital_profile');
//               }
//             },
//             child: Text("SignUp")),
//       );
//     });
//   }
// }
