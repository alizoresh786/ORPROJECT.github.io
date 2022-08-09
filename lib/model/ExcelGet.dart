import 'package:flutter/foundation.dart';

class GetExcel {
  double? ArrivalTime;
  double? ServiceTime;
  GetExcel(  {  this.ArrivalTime, this.ServiceTime});
  factory GetExcel.fromJson(dynamic json) {
    return GetExcel(
        ArrivalTime: json['ArrivalTime'], ServiceTime: json['ServiceTime']);
  }
  Map toJson() => {"ArrivalTime": ArrivalTime, "ServiceTime": ServiceTime};
}
