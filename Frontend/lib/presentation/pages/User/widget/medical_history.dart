import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Medicalhist extends StatelessWidget {
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

                // _check(),
                // Divider(),

                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Text("Asthma"),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(),
                              ]);
                            }),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed('medicalForm');
                      },
                      child: Text('Form'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //      Row(children:[ Checkbox(value: check_2, onChanged: (newval) {
  //        setState(() {
  //          check_2 = !check_2;
  //        });
  //      },

  //      ),
  //        SizedBox(
  //          width: 20,
  //        ),
  //        Text("Cancer"),]),

  //       Divider(),

  //       Row(children: [ Checkbox(value: check_3, onChanged: (newval) {
  //         setState(() {
  //           check_3 = !check_3;
  //         });
  //       },
  //       ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //         Text("Diabetes"),],),

  //       Divider(),

  //       Row(children: [  Checkbox(value: check_4, onChanged: (newval) {
  //         setState(() {
  //           check_4 = !check_4;
  //         });
  //       },
  //       ),
  //         SizedBox(
  //           width: 20,
  //         ),Text("Blood Pressure"),],),

  //       SizedBox(
  //         width: 40,
  //         height: 50,),

  //       ElevatedButton(onPressed: (){}, child: Text('Save'))

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
