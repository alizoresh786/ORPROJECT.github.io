import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directLandingPage.dart';
import 'package:queuesim/pages/indirectLandingPage.dart';
import 'package:queuesim/widgets/button.dart';
import 'package:queuesim/widgets/paragraph.dart';

class Indirect extends StatelessWidget {
  const Indirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  var state = Provider.of<AppState>((context), listen: false);
    return DataTable(
      columns: [
        DataColumn(
        label: Text("Arrival"),
     ),
     DataColumn(
        label: Text("Service"),
       ),
      ],
      rows:state.ArrivalService.map(
        (e) => DataRow(cells: [
           DataCell(
                      Text(e.A.toString()),
                    ),
                    DataCell(
                      Text(e.B.toString()),
                    ),
        ])
        ).toList()
    );
  }
}