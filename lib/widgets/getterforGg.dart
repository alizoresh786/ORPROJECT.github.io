import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:queuesim/widgets/textfield.dart';

class   GGGetter extends StatelessWidget {
   GGGetter({Key? key}) : super(key: key);
TextEditingController xyz = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                child: Text('Gamma/Uniform'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Gamma/Uniform/server(s):'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Paragraph(para: "Enter Gamma Distr aplha (inter arrival) :", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Gamma Distr beta (inter arrival):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Uniform Distr lower value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Uniform Distr upper value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter number of server(s):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                             ElevatedButton(
                               child: Text('Simulate'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(67, 162, 220, 1),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                                      textStyle:
                                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                child: Text('Uniform/Gamma'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Uniform/Gamma/server(s)'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Paragraph(para: "Enter Uniform Distr aplha (inter arrival) :", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Uniform Distr beta (inter arrival):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Gamma Distr lower value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Gamma Distr upper value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter number of server(s):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                             ElevatedButton(
                               child: Text('Simulate'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(67, 162, 220, 1),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                                      textStyle:
                                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                child: Text('Gamma/Beta'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Gamma/Beta/server(s)'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Paragraph(para: "Enter Gamma Distr aplha (inter arrival) :", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Gamma Distr beta (inter arrival):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Beta Distr lower value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Beta Distr upper value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter number of server(s):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                             ElevatedButton(
                               child: Text('Simulate'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(67, 162, 220, 1),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                                      textStyle:
                                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                child: Text('Beta/Gamma'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Beta/Gamma/server(s)'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Paragraph(para: "Enter Beta Distr aplha (inter arrival) :", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Beta Distr beta (inter arrival):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Gamma Distr lower value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Gamma Distr upper value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter number of server(s):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                             ElevatedButton(
                               child: Text('Simulate'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(67, 162, 220, 1),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                                      textStyle:
                                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                child: Text('Uniform/Beta'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Uniform/Beta/server(s)'),
                         content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Paragraph(para: "Enter Uniform Distr aplha (inter arrival) :", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Uniform Distr beta (inter arrival):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Beta Distr lower value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Beta Distr upper value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter number of server(s):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                             ElevatedButton(
                               child: Text('Simulate'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(67, 162, 220, 1),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                                      textStyle:
                                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                child: Text('Beta/Uniform'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Beta/Uniform/server(s)'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Paragraph(para: "Enter Beta Distr aplha (inter arrival) :", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Beta Distr beta (inter arrival):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Uniform Distr lower value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter Uniform Distr upper value (service):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                                Paragraph(para: "Enter number of server(s):", R: 67, G: 162, B: 220),
                                TexttField(Controller:xyz ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                             ElevatedButton(
                               child: Text('Simulate'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(67, 162, 220, 1),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                                      textStyle:
                                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
