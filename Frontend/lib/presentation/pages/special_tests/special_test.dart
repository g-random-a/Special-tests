import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/specialTest/bloc/CatagoryTestBloc.dart';
import 'package:special_tests/application/specialTest/bloc/specialTestDetailBloc.dart';
import 'package:special_tests/application/specialTest/states/CatagoryTestState.dart';
import 'package:special_tests/domain/hospital/entity/HospitalTestHelper.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/presentation/pages/index.dart';
import 'package:special_tests/application/request/bloc/requestbloc.dart';
// import 'package:special_tests/application/request/index.dart';

import '../../Common/Color.dart';
part 'widgets/body.dart';

class Special_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CatagoryTestBloc, CatagoryTestState>(
          builder: (context, state) {
        if (state is CatagoryTestHospitalLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        }
        if (state is CatagoryTestHospitalSuccess) {
          return ListView(
            children: [
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  height: 100,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, bottom: 20),
                        child: Text(
                          state.catagory,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ))),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: TextField(
                  cursorColor: Colors.teal,
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
                      fillColor: Color.fromARGB(255, 17, 84, 113)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 600,
                height: 600,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: state.hospitalandtest.length,
                    itemBuilder: (BuildContext context, int index) =>
                        body(state.hospitalandtest[index]),
                  ),
                ),
              )
            ],
          );
        }
        return Center(
          child: Text("Can not fetch catagorized hospitals"),
        );
      }),
      bottomNavigationBar: bottombar(),
    );
  }
}
