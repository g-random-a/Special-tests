import 'package:flutter/material.dart';

class Medicalhistory extends StatefulWidget {
  @override
  _MedicalhistoryState createState() => _MedicalhistoryState();
}

class _MedicalhistoryState extends State<Medicalhistory> {
  var check = false;
  var check_2 = false;
  var check_3 = false;
  var check_4 = false;
  var check_5 = false;

  // var checkboxlistlabels=["Cancer","Asthma","Diabetes","Blood Pressure"];
  // Map<String, bool>checkboxListValues={
  //   // return [C]
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medical History')),
      body: Center(
        child: Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 430,
                height: 700,
                child: Column(
                  children: [
                    Text(
                      'Check of you or any of your family members has it ',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 40,
                      height: 70,
                    ),
                    // _check(),
                    // Divider(),
                    Row(
                      children: [
                        Checkbox(
                          value: check,
                          onChanged: (newval) {
                            setState(() {
                              check = !check;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Asthma"),
                      ],
                    ),

                    Divider(),

                    Row(children: [
                      Checkbox(
                        value: check_2,
                        onChanged: (newval) {
                          setState(() {
                            check_2 = !check_2;
                          });
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Cancer"),
                    ]),

                    Divider(),

                    Row(
                      children: [
                        Checkbox(
                          value: check_3,
                          onChanged: (newval) {
                            setState(() {
                              check_3 = !check_3;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Diabetes"),
                      ],
                    ),

                    Divider(),

                    Row(
                      children: [
                        Checkbox(
                          value: check_4,
                          onChanged: (newval) {
                            setState(() {
                              check_4 = !check_4;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Blood Pressure"),
                      ],
                    ),

                    SizedBox(
                      width: 40,
                      height: 50,
                    ),

                    ElevatedButton(onPressed: () {}, child: Text('Save'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  //
  //
  //
  // _check(){
  //
  //
  // // }
  // // List<Widget> _checkboxlist(){
  // //   return checkboxlistlabels.map((label)=>CheckboxListTile(
  // //     title: Text(label),
  // //     value: checkboxListValues[label]??false,
  // //     onChanged: (nwval){
  // //       setState(() {
  // //         if(checkboxListValues[label]==null){
  // //           checkboxListValues[label]=true;
  // //         }
  // //         checkboxListValues[label]=!checkboxListValues[label]
  // //       });
  // //     },
  // //   )
  //
  //      }
}
