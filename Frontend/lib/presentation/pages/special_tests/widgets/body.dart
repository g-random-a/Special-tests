part of '../special_test.dart';

class body extends StatelessWidget {
  HospandTest hospital;
  body(this.hospital);
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.teal,
      shadowColor: Colors.black,
      child: Padding(
          padding: EdgeInsets.all(40),
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
                          child: Icon(Icons.home_filled),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hospital.hospital.name,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.bookmark,
                                  // color: Colors.yellow,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  hospital.hospital.description,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.money),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  hospital.test.description,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.event_available),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  hospital.test.price.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ],
                    ),
                  ]),
              Padding(
                  padding: EdgeInsets.all(9),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromARGB(255, 17, 84, 113)),
                              //width: 400,
                              height: 100,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        hospital.test.availablity.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )))),
                        ),
                      ],
                    ),
                  )),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TestDetailBloc>(context).add(loadTestDetail(
                      test: hospital.test, hosp: hospital.hospital));
                  context.goNamed('testDetail');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 236, 255, 253),
                ),
                child: Text(
                  "Test Detail",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('hospital_profile');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 236, 255, 253),
                ),
                child: Text(
                  "View Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
