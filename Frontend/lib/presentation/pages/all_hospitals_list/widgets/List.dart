import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/hospital%20profile/bloc/hospitalBloc.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/presentation/pages/all_hospitals_list/widgets/TestAvailable.dart';
import 'package:special_tests/presentation/pages/index.dart';

class list extends StatelessWidget {
  // final int index;
  Hospital hospital;
  list(this.hospital);

  @override
  Widget build(BuildContext context) {
    return Card(
        surfaceTintColor: Colors.teal,
        shadowColor: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.teal),
                          child: Icon(
                            Icons.home_filled,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hospital.name,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              hospital.address,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.local_hospital),
                                Text(
                                  hospital.specialTest.length.toString() +
                                      " Availble tests",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.lock_clock),
                                Text(
                                  "24 Hours",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 300,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<hospitalBloc>(context)
                                .add(loadHospital(hospital: hospital));
                            context.goNamed('hospital_profile');
                          },
                          child: Text(
                            "View",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 600,
                height: 270,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hospital.specialTest.length,
                    itemBuilder: (BuildContext context, int index) =>
                        testAvailable(hospital.specialTest[index], hospital)),
              ),
            ],
          ),
        ));
  }
}
