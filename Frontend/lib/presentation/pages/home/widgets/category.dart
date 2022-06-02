import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/specialTest/bloc/CatagoryTestBloc.dart';
import 'package:special_tests/application/specialTest/events/CatagoryTestEvent.dart';

class Content {
  String Title;
  String image;
  Content(this.Title, this.image);
}

final Test = [
  Content("Blood Test", 'assets/Blood.jpg'),
  Content("Insulin Test", 'assets/diabetes.jpg'),
  Content("DNA Test", 'assets/dna.jpg'),
  Content("Fertility Test", 'assets/fertility.jpg'),
  Content("MRI Test", 'assets/mri.jpg'),
  Content("Heart Test", 'assets/stethoscope.jpg')
];

class Categories extends StatelessWidget {
  final int categoryNo;
  const Categories(this.categoryNo);
  @override
  Widget build(BuildContext context) {
    final Content = Test[categoryNo];
    return GestureDetector(
      onTap: () {
        BlocProvider.of<CatagoryTestBloc>(context)
            .add(loadCatagoryHospital(catagory: Test[categoryNo].Title));
        context.pushNamed('special_test');
      },
      child: Card(
        elevation: 5,
        shadowColor: Color.fromARGB(255, 0, 46, 42),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          color: Color.fromARGB(255, 17, 84, 113),
                          image: DecorationImage(
                              image: AssetImage(Content.image),
                              fit: BoxFit.cover))),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      Content.Title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          decorationColor: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
