import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/hospital%20profile/bloc/hospitalProfileEditBloc.dart';
import 'package:special_tests/presentation/Common/Color.dart';

class HospitalEditProfile extends StatelessWidget {
  HospitalEditProfile({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Edit Hospital profile'),
          backgroundColor: AppColor.primaryColor,
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
              backgroundColor: AppColor.primaryColor,
            ),
            SizedBox(
              width: 50,
            ),
            Text('Change Profile Picture'),
//             hospitalLoadingState
// hospitalLoadedSuccess
// hospitalLoadedError
            BlocBuilder<HospProfileEditBloc, HospitalProfileEditState>(
                builder: (context, state) {
              if (state is hospitalLoadingState) {
                return Center(
                  child:
                      CircularProgressIndicator(color: AppColor.primaryColor),
                );
              }

              if (state is hospitalLoadedSuccess) {
                nameController.value = TextEditingValue(text:state.hosp.name);
                locationController.value = TextEditingValue(text:state.hosp.address);
                descriptionController.value = TextEditingValue(text:state.hosp.description);
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      ListTile(
                        tileColor: Colors.white,
                        title: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person,
                                color: Color.fromARGB(255, 21, 188, 171)),
                            hintText: 'Name',
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
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        title: TextFormField(
                          controller: locationController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.location_on,
                                color: Color.fromARGB(255, 21, 188, 171)),
                            hintText: 'location',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null,
                          validator: (String? location) {
                            if (location == null || location.isEmpty) {
                              return "Location must not be empty";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        title: TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 21, 188, 171),
                            ),
                            hintText: 'Descrpition',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                          validator: (String? description) {
                            if (description == null || description.isEmpty) {
                              return "Description must not be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<HospProfileEditBloc,
                              HospitalProfileEditState>(
                          listenWhen: (previous, current) =>
                              current is updateProfileSuccess,
                          listener: (context, state) {
                            context.pop();
                          },
                          builder: (context, state) {
                            Widget button = Text("Update",
                                style: TextStyle(
                                    backgroundColor:
                                        Color.fromARGB(255, 21, 188, 171)));
                            if (state is updatingHospital) {
                              button = SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator(
                                    color: Colors.teal,
                                  ));
                            }
                            if (state is updateProfileSuccess) {
                              button = Icon(Icons.check);
                            }
                            if (state is updateProfileFailed) {
                              button = Icon(Icons.refresh_outlined);
                            }
                            return ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 21, 188, 171)),
                              child: button,
                            );
                          })
                    ],
                  ),
                );
              }
              return Center(
                child: Text("Can not load please try again"),
              );
            }),
          ]),
        )));
  }
}
