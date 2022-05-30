import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/application/hospital_list/bloc/hopitalListBloc.dart';
import 'package:special_tests/application/hospital_list/states/hospital_list_state.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/all_hospitals_list/widgets/List.dart';
import 'package:special_tests/presentation/pages/index.dart';

class HospitalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<hospitalListBloc, HospitalListState>(
          builder: (context, state) {
        if (state is HospitalListLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        } else if (state is HospitalListLoadingFailure) {
          return const Center(
            child: Text("Unable to load hospitals"),
          );
        } else if (state is HospitalListLoadingSuccess) {
          return ListView(
            children: [
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40))),
                  width: double.infinity,
                  height: 100,
                  child: const Center(
                    child: Text(
                      "ALL Hospitals Lists",
                      key: const Key("btn2"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 600,
                height: 600,
                child: Expanded(
                  child: ListView.builder(
                      itemCount: state.hospitals.length,
                      itemBuilder: (BuildContext context, int index) =>
                          list(state.hospitals[index])),
                ),
              )
            ],
          );
        }
        return const SizedBox();
      }),
      bottomNavigationBar: bottombar(),
    );
  }
}
