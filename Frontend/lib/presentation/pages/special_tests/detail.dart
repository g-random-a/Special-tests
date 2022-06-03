import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/auth/bloc/user_status_bloc.dart';
import 'package:special_tests/application/auth/events/status_events.dart';
import 'package:special_tests/application/auth/states/status_state.dart';
import 'package:special_tests/application/specialTest/bloc/specialTestBloc.dart';
import 'package:special_tests/application/specialTest/bloc/specialTestDetailBloc.dart';
import 'package:special_tests/domain/request/entity/request.dart';
import 'package:special_tests/presentation/Common/Color.dart';

import '../../../application/request/bloc/requestbloc.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => DetailState();
}

class DetailState extends State<Detail> {
  bool x = true;

  @override
  Widget build(BuildContext context) {
    final testBloc = BlocProvider.of<TestDetailBloc>(context);
    return BlocBuilder<TestDetailBloc, TestDeatilState>(
        builder: (context, state) {
      if (state is TestDetailLoading) {
        return Center(
          child: CircularProgressIndicator(color: AppColor.primaryColor),
        );
      }

      if (state is TestDetailLoadingSuccess) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.specialTests.category),
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<specialTestBloc>(context)
                        .add(loadSpecialTest(test: state.specialTests));
                    GoRouter.of(context).pushNamed('editSpecialTest');
                  },
                  icon: Icon(Icons.edit))
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                // child:
                Row(
                  children: [
                    Text(
                      state.specialTests.name,
                      style: TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final requestBloc =
                            BlocProvider.of<requestbloc>(context);
                        requestBloc.add(makeRequest(Request(
                            requestId: "",
                            to: state.hosp,
                            from: null,
                            test: state.specialTests,
                            date: "",
                            status: "AWAITING")));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 236, 255, 253),
                      ),
                      child: Text(
                        "Request",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text('Name of the Special test'),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                    'this is description about the special test and it will continue'),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Price: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('10'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Availability :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        TextButton(onPressed: () {}, child: Text('Available')),
                        SizedBox(
                          width: 50,
                        ),
                        TextButton(
                            onPressed: () {}, child: Text('UnAvailable')),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'Delete',
                            style: TextStyle(
                                color: Color.fromARGB(255, 34, 10, 8)),
                          ),
                          content: const Text(
                              'Do you want to delete this special test?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                WidgetsBinding.instance.addPostFrameCallback(
                                    (_) => setState(() {}));
                              },
                              child: const Text('Delete'),
                            ),
                            TextButton(
                              onPressed: () => context.pop(),
                              child: const Text('cancel'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Delete')),
              ],
            ),
          ),
        );
      }
      return Center(
        child: Text("Can not find please try again"),
      );
    });
  }
}
