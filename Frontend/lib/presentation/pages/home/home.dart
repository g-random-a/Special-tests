import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/user_status_bloc.dart';
import 'package:special_tests/application/auth/states/status_state.dart';
import 'package:special_tests/application/hospital_list/bloc/hopitalListBloc.dart';
import 'package:special_tests/application/hospital_list/bloc/popularHospitalBloc.dart';
import 'package:special_tests/application/hospital_list/events/hospital_list_events.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/home/widgets/category.dart';
import 'package:special_tests/presentation/pages/home/widgets/popular_hospitals.dart';
import 'package:special_tests/presentation/pages/index.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<AuthStatusBloc, AuthStatusState>(
            listenWhen: (previous, current) => current is UnAuthenticatedState,
            listener: (context, state) {
              context.goNamed("login");
            },
            builder: (context, state) {
              print("home");
              print(state);
              if (state is AuthenticatedState) {
                return Scaffold(
                  body: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.teal),
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.user.username,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 35),
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.notifications,
                                    size: 30,
                                    color: Colors.teal,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: TextField(
                            cursorColor: Colors.white,
                            cursorRadius: Radius.circular(10.0),
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Search Hospitals",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.teal),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            // height: 550,
                            // width: 400,
                            child: Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemCount: 6,
                                itemBuilder: (BuildContext, int index) =>
                                    Categories(index),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Most Popular",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    BlocProvider.of<hospitalListBloc>(context)
                                        .add(loadHospitals());
                                    context.goNamed('HospitalList');
                                  },
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<hospitalListBloc>(context)
                                        .add(loadHospitals());
                                    context.goNamed('HospitalList');
                                  },
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  iconSize: 20,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 600,
                          height: 600,
                          // color: Colors.teal,
                          child: BlocBuilder<PopularHospitalBloc,
                              PopularHospitalState>(builder: (context, state) {
                            if (state is PopularHospitalLoading) {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              ));
                            }
                            if (state is PopularHospitalLoadFailure) {
                              return Center(
                                child: Text("Can not fetch popular hospitals"),
                              );
                            }
                            if (state is PopularHospitalLoadSuccess) {
                              return Expanded(
                                child: ListView.builder(
                                    itemCount: state.hospitals.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            popular_hospitals(
                                              hospital: state.hospitals[index],
                                            )),
                              );
                            }
                            return SizedBox();
                          }),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: bottombar(),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                  strokeWidth: 10,
                ),
              );
            }));
  }
}
