import 'dart:js';
import 'package:path/path.dart' as Path;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XYDATA {
  late final double X;
  late final double Y;
  static const kPrimaryColor = Colors.amber;
  XYDATA(this.X, this.Y);
}

class ABdata {
  late final double A;
  late final double B;
  ABdata(this.A, this.B);
}

class AppState extends ChangeNotifier {
  final List<XYDATA> MergeXY = [];
  final List X = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ];
  late List Y = [];
  late List Z = Y.reversed.toList();

  fact(int x) {
    if (x == 0) {
      return 1;
    } else {
      return x * fact(x - 1);
    }
  }

  //-----------------controllersOfTextfield DIRECT MM MODEL---------------//

  final meanInterArrival = TextEditingController();
  final meanService = TextEditingController();
  final no_of_server = TextEditingController();

  //-----------------controllersOfTextfield DIRECT MG MODEL---------------//

  final a = TextEditingController();
  final b = TextEditingController();

  //------------------Direct Method----------------------//

  late double meanArrival = 1 / (double.parse(meanInterArrival.text));
  late double meanservice = 1 / (double.parse(meanService.text));
  late double servers = double.parse(no_of_server.text);
  late double maximum = double.parse(b.text);
  late double minimum = double.parse(a.text);
  late double singleServerUtilization;
  late double multiServerUtilization;
  late double avgLengthQueue_singleServer;
  late double avgLengthQueue_multiServer;
  late double avgLengthSys_singleServer;
  late double avgLengthSys_multiServer;
  late double avgWaitSys_singleServer;
  late double avgWaitSys_multiServer;
  late double avgWaitQueue_singleServer;
  late double avgWaitQueue_multiServer;
  late double pnotSum = 0;
  late double pnotRemain = 0;
  late double pnot = (1 / (pnotSum + pnotRemain));
  late String kendallNotation;
  late String ArrivalDistr;
  late String ServiceDistr;

//---------------M/M/1------------------------------------------//

  //utilization factor for single server:
  singleserverRho(double meanArrival, double meanService) {
    singleServerUtilization = (meanArrival / meanService);
    notifyListeners();
  }

  //average length of single queue:
  singleServerLq() {
    avgLengthQueue_singleServer =
        ((singleServerUtilization * singleServerUtilization) /
            (1 - singleServerUtilization));
    notifyListeners();
  }

  //average length of single system:
  singleServerLs(
    double meanArrival,
    double meanService,
  ) {
    avgLengthSys_singleServer = (meanArrival / (meanService - meanArrival));
    notifyListeners();
  }

  //average waiting of single system:
  singleServerWs(
    double meanArrival,
    double meanService,
  ) {
    avgWaitSys_singleServer = (1 / (meanService - meanArrival));
    notifyListeners();
  }

  //average wait of single queue:
  singleServerWq(
    double meanArrival,
    double meanService,
  ) {
    avgWaitQueue_singleServer =
        (meanArrival / meanService) * (1 / (meanService - meanArrival));
    notifyListeners();
  }

  // n customers in the system
  Ncust(double singleServerRho) {
    for (var i = 0; i < 26; i++) {
      Y.add((pow(singleServerRho, i) * (1 - singleServerRho)));
    }
    for (var i = 0; i < 26; i++) {
      MergeXY.add(XYDATA(X[i], Z[i]));
    }
    notifyListeners();
  }

//---------------------------M/M/c-------------------------------------//

  //utilization factor for multi server:
  multiserverRho(double meanArrival, double meanService, double no_of_servers) {
    multiServerUtilization = (meanArrival / (no_of_servers * meanservice));
    notifyListeners();
  }

  pnotSumm(double meanArrival, double meanService, double no_of_server) {
    for (var i = 0; i < no_of_server; i++) {
      pnotSum += (pow(servers * (multiServerUtilization), i) / fact(i));
    }
    notifyListeners();
  }

  pnotRemaining(double no_of_server) {
    pnotRemain = (pow(no_of_server * (multiServerUtilization), no_of_server) /
        (fact(int.parse(no_of_server.toString())) *
            (1 - (multiServerUtilization))));
  }

  //average length of multi server queue:
  multiServerLq(
    double meanArrival,
    double meanService,
  ) {
    avgLengthQueue_multiServer = ((pnot *
            pow((meanArrival / meanservice), servers) *
            multiServerUtilization) /
        (fact(int.parse(servers.toString())) *
            pow((1 - multiServerUtilization), 2)));
    notifyListeners();
  }

  //average length of multi queue:
  multiServerLs(
    double meanArrival,
    double meanService,
  ) {
    avgLengthSys_multiServer =
        avgLengthQueue_multiServer + (meanArrival / meanservice);
    notifyListeners();
  }

  //average wait in multiserver queue:
  multiServerWq(
    double lenOfQueue,
    double meanArrival,
  ) {
    avgWaitQueue_multiServer = lenOfQueue / meanArrival;
    notifyListeners();
  }

  //average wait in multiserver system:
  multiServerWs(double waitQueueMulti, meanService) {
    avgWaitSys_multiServer = waitQueueMulti + (1 / meanservice);
    notifyListeners();
  }

//---------------------------M/G/1---------------------------------//
  late double GammaMean;
  late double GammaVariance;
  late double UniformMean;
  late double UniformVariance;
  late double BetaMean;
  late double BetaVariance;

  GammaAverage(double maxi, double mini) {
    GammaMean = maxi * mini;
    notifyListeners();
  }

  GammaVar(double maxi, double mini) {
    GammaVariance = (maxi * maxi) * mini;
    notifyListeners();
  }

  UniformAverage(double maxi, double mini) {
    UniformMean = (maxi + mini) / 2;
    notifyListeners();
  }

  UniformVar(double maxi, double mini) {
    UniformVariance = (pow((maxi - mini), 2)) / 12;
    notifyListeners();
  }

  BetaAverage(double maxi, double mini) {
    BetaMean = mini / (maxi + mini);
    notifyListeners();
  }

  BetaVar(double maxi, double mini) {
    BetaVariance = (maxi * mini) / (pow((maxi + mini), 2) * (maxi + mini + 1));
    notifyListeners();
  }

  MGlq(double meanArrival, double rho, double variance_Sys) {
    avgLengthQueue_singleServer =
        (((meanArrival * meanArrival) * variance_Sys) +
                pow(singleServerUtilization, 2)) /
            (2 * (1 - singleServerUtilization));
    notifyListeners();
  }

  MGls(double meanArrival, double waitinSys) {
    avgLengthSys_singleServer = meanArrival * waitinSys;
    notifyListeners();
  }

  MM() {
    if (servers == 1) {
      singleserverRho(meanArrival, meanservice);
      singleServerLq();
      singleServerLs(meanArrival, meanservice);
      singleServerWq(meanArrival, meanservice);
      singleServerWs(meanArrival, meanservice);
      Ncust(singleServerUtilization);
      kendallNotation = 'M/M/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Exponential';
      print(meanArrival);
      print(meanservice);
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgLengthSys_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
    } else {
      multiserverRho(meanArrival, meanservice, servers);
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerLs(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);
      multiServerWs(avgWaitQueue_multiServer, meanservice);

      print(meanArrival);
      print(meanservice);
      print(multiServerUtilization);
      print(avgLengthQueue_multiServer);
      print(avgLengthSys_multiServer);
      print(avgWaitSys_multiServer);
      print(avgWaitQueue_multiServer);
      print(pnot);
      notifyListeners();
    }
  }

  MGGamma() {
    if (servers == 1) {
      GammaAverage(maximum, minimum);
      meanservice = GammaMean;
      GammaVar(maximum, minimum);
      singleserverRho(meanArrival, meanservice);
      print(singleServerUtilization);
      MGlq(meanArrival, singleServerUtilization, GammaVariance);
      print(avgLengthQueue_singleServer);
      multiServerWq(avgLengthQueue_singleServer, meanArrival);
      print(avgWaitQueue_multiServer);
      multiServerWs(avgWaitQueue_multiServer, meanservice);
      print(avgWaitSys_multiServer);
      MGls(meanArrival, avgWaitSys_multiServer);
      print(avgLengthSys_singleServer);
    } else {}
    notifyListeners();
  }

  MGUniform() {
    if (servers == 1) {
      UniformAverage(maximum, minimum);
      meanservice = 1 / UniformMean;
      UniformVar(maximum, minimum);
      singleserverRho(meanArrival, meanservice);
      print(singleServerUtilization);
      MGlq(meanArrival, singleServerUtilization, UniformVariance);
      print(avgLengthQueue_singleServer);
      multiServerWq(avgLengthQueue_singleServer, meanArrival);
      print(avgWaitQueue_multiServer);
      multiServerWs(avgWaitQueue_multiServer, meanservice);
      print(avgWaitSys_multiServer);
      MGls(meanArrival, avgWaitSys_multiServer);
      print(avgLengthSys_singleServer);
    } else {}
    notifyListeners();
  }

//----------------------------------------Indirect Method----------------------------//

  final List<ABdata> ArrivalService = [];
  final List<double> TAT = [];
  double server1 = 0;
  double value = 0;
  late List<double> ArrivalList = [
    0,
    2,
    7,
    8,
    11,
    12,
    14,
    15,
    15,
    15,
    15,
    15,
    15,
    17,
    17,
    20
  ];
  late List<double> ServiceList = [
    5,
    7,
    12,
    8,
    7,
    7,
    6,
    15,
    13,
    11,
    11,
    10,
    6,
    7,
    8,
    15
  ];
  late double server3 = 0;
  final ServiceStart = [];
  final ServiceEnd = [];
  final WTQ = [];
  ArrivServ() {
    for (var i = 0; i < ServiceList.length; i++) {
      ArrivalService.add(ABdata(ArrivalList[i], ServiceList[i]));
    }
  }

  ServiceTime() {
    ArrivServ();
    for (var i = 0; i < ArrivalList.length; i++) {
      if (ArrivalList[i] == 0) {
        ServiceStart.add(0);
      } else {
        ServiceStart.add(value);
      }
      ServiceEnd.add(ArrivalService[i].B + value);
      value += ArrivalService[i].B;
      TAT.add(ServiceEnd[i] - ArrivalList[i]);
      WTQ.add(ServiceStart[i] - ArrivalList[i]);
    }

    print(ServiceStart);
    print(ServiceEnd);
    print(TAT);
    print(WTQ);
  }

  notifyListeners();
}
