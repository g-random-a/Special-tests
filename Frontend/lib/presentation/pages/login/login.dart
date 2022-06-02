import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/auth_bloc.dart';
import 'package:special_tests/application/auth/bloc/user_status_bloc.dart';
import 'package:special_tests/application/auth/events/auth_events.dart';
import 'package:special_tests/application/auth/events/status_events.dart';
import 'package:special_tests/application/auth/states/auth_state.dart';
import 'package:special_tests/presentation/animation/clipper.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/signup/hospitalRegistration.dart';

import '../../../main.dart';
// import 'package:special_tests/services/hh.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;

  final _loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(children: [
          ClipPath(
              clipper: AppClipper(),
              child: Container(
                color: AppColor.primaryColor.shade300,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
              )),
          ClipPath(
              clipper: AppClipper(),
              child: Container(
                color: AppColor.primaryColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              )),
          Container(
              padding: EdgeInsets.fromLTRB(35, 35, 0, 0),
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 50,
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ]),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Center(
            child: Form(
              key: _loginFormKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    padding: EdgeInsets.fromLTRB(
                        // MediaQuery.of(context).size.width * 0.15,
                        0,
                        // MediaQuery.of(context).size.height * 0.03,
                        0,
                        0,
                        0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phonelink_lock_rounded,
                          color: AppColor.primaryColor,
                          size: 45,
                        ),
                        Text(
                          // "Welcome Back",
                          "Login", key: const Key("LoginText"),
                          style: TextStyle(
                              fontSize: 30,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                      ],
                    )),
                SizedBox(height: 25),
                TextFormField(
                  key: const Key('EmailField'),
                  controller: emailController,
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
                SizedBox(height: 15),
                TextFormField(
                  key: const Key('PasswordField'),
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
                SizedBox(
                  height: 35,
                ),
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                  var submit = null;
                }, builder: (_, state) {
                  Widget txt = Text("Login",
                      style: TextStyle(
                          color: AppColor.secondaryColor, fontSize: 20));
                  void Function()? onPressed = () {
                    bool? valid = _loginFormKey.currentState?.validate();
                    if (!valid!) return;

                    final regBloc = BlocProvider.of<AuthBloc>(context);
                    regBloc.add(LoginEvent(
                        login: Login(
                            email: emailController.text,
                            password: passwordController.text)));
                  };
                  bool registering = false;

                  if (state is LoggingIn) {
                    print("hello");
                    txt = SizedBox(
                      child: CircularProgressIndicator(
                        strokeWidth: 6,
                        color: AppColor.secondaryColor,
                      ),
                    );
                    onPressed = null;
                    registering = true;
                  } else if (state is LoginSuccess) {
                    txt = Icon(
                      Icons.verified,
                      color: AppColor.secondaryColor,
                    );
                    BlocProvider.of<AuthStatusBloc>(context)
                        .add(CheckAuthenticationEvent());
                    context.goNamed("check");
                  } else if (state is LogginError) {
                    print(state.errorMsg);
                  }

                  return ElevatedButton(
                    onPressed: onPressed,
                    child: txt,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.primaryColor),
                        elevation: MaterialStateProperty.all(10)),
                  );
                }),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Do not have an account? "),
                    InkWell(
                      key: const Key("NoAccountSignUP"),
                      child: Text("Sign Up",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                      onTap: () {
                        context.go(Routes.signup);
                      },
                    )
                  ],
                )
              ]),
            ),
          ),
        ))
      ]),
    );
  }

  void submitForm() {}
}
