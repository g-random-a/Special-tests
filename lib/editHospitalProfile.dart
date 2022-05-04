import 'package:flutter/material.dart';

class editHospitalProfile extends StatelessWidget {
  const editHospitalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Container(
          child: Text('form to edit the hospital profile'),
        ),
      ),
    );
  }
}
