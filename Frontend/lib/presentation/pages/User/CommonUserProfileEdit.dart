import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/auth_bloc.dart';
import 'package:special_tests/application/user/bloc/UserBloc.dart';
import 'package:special_tests/presentation/Common/Color.dart';

class CommonUserProfileEdit extends StatefulWidget{
   const CommonUserProfileEdit({Key? key}) : super(key : key);
  @override
  State<StatefulWidget> createState() => CommonUserProfileEditState();
}
class CommonUserProfileEditState extends State<CommonUserProfileEdit> {
 
  final _loginFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool visible = false;
  @override
  Widget build(BuildContext context) {
  BuildContext ctx = context;
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
              child: Form(
                key: _loginFormKey,
                child: Column(children: [
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
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                 
                  SizedBox(height: 10),
                  TextFormField(
                    controller: usernameController,
                    cursorColor: Colors.black,
                    cursorRadius: Radius.circular(10.0),
                    
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "UserName",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                    ),
                    validator: (String? name){
                      if (name == null || name.isEmpty){
                        return "Name must not be empty";
                      }
                      return null;
                    },
                        
                  ),
                  SizedBox(height: 10),
               
                  TextFormField(
                    controller: emailController,
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
                    ),
                     validator: (String? email) { 
                   if (email == null || email.isEmpty) { 
                     return "Email must not be empty"; 
                   } 
  
                   final validEmail = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]"); 
                   final correct = validEmail.hasMatch(email); 
  
                   return correct ? null : "Enter a valid email"; 
                 }, 
                  ),
                  
                  SizedBox(height: 10),

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
                    // helperText: "Password length must be greater then 8",

                    // helperStyle: TextStyle(color: Colors.black54),
                    helperMaxLines: 1,
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    // hintTextDirection: TextDirection.rtl,
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
                      // borderRadius:
                      //     const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
               BlocConsumer<UserBloc, UserState>(
                    listenWhen: (previous, current) => current is updateUserSuccess,
                    listener: (context, state) {
                     context.pop();
                  },
                  builder: (context, state) { 
                    Widget button = Text("Update",
                          style: TextStyle(
                              backgroundColor:
                                  Color.fromARGB(255, 21, 188, 171)));
                    if (state is updatingUser){
                      button = SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(color: Colors.teal,));
                    }
                    if (state is updateUserSuccess){
                      button = Icon(Icons.check);
                    }
                    if (state is updateUserFailed) {
                      button = Icon(Icons.refresh_outlined);
                    }
                    return ElevatedButton(
                      onPressed: () {},
                       style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 188, 171)),
                      child: button,
                    );})
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
