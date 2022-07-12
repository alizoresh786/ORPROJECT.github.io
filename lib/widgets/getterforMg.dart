import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:queuesim/widgets/textfield.dart';

class MgGetter extends StatelessWidget {
  MgGetter({Key? key}) : super(key: key);
  TextEditingController xyz = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      child: Container(
          width: 200.w,
          height: 100.h,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Service time Follows Gamma Distribution'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Markovian/Gamma/single server'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Paragraph(
                                  para: "Enter aplha value:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.a),
                              Paragraph(
                                  para: "Enter beta value:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.b),
                              Paragraph(
                                  para: "Enter inter arrival mean:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.meanInterArrival),
                              Paragraph(
                                  para: "Enter number of server(s):",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.no_of_server),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Simulate'),
                              onPressed: () {
                                state.MGGamma();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(67, 162, 220, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 150, vertical: 20),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(67, 162, 220, 1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                child: Text('Service time Follows Uniform Distribution'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Markovian/General/single server'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Paragraph(
                                  para: "Enter greatest value:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.b),
                              Paragraph(
                                  para: "Enter lowest value:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.a),
                              Paragraph(
                                  para: "Enter inter arrival mean:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.meanInterArrival),
                              Paragraph(
                                  para: "Enter number of server(s):",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.no_of_server),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Simulate'),
                              onPressed: () {
                                state.MGUniform();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(67, 162, 220, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 150, vertical: 20),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(67, 162, 220, 1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                child: Text(' Service time Follows Beta Distribution     '),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Markovian/General/single server'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Paragraph(
                                  para: "Enter aplha value:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: xyz),
                              Paragraph(
                                  para: "Enter beta value:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: xyz),
                              Paragraph(
                                  para: "Enter inter arrival mean:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: xyz),
                              Paragraph(
                                  para: "Enter number of server(s):",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: xyz),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Simulate'),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(67, 162, 220, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 150, vertical: 20),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(67, 162, 220, 1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
    );
  }
}
