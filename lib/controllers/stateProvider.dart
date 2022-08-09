import 'dart:js';
import 'package:path/path.dart' as Path;
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queuesim/pages/mg.dart';

class XYDATA {
  late final double X;
  late final double Y;
  XYDATA(this.X, this.Y);
}

class HISTDATA {
  late final double Y;
  HISTDATA(this.Y);
}

class HISTDATA_ARRIVAL {
  late final double Y;
  HISTDATA_ARRIVAL(this.Y);
}

class HISTDATA_SERVICE {
  late final double Y;
  HISTDATA_SERVICE(this.Y);
}

class ABdata {
  // A --> interarrival
  // B --> service
  // C --> arrival
  // D --> service start
  // E --> service end
  // F --> idle
  // G --> Turn around time
  // H --> Wait in queue
  late final double A;
  late final double B;
  late final double C;
  late final double D;
  late final double E;
  late final double F;
  late final double G;
  late final double H;
  ABdata(this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H);
}

class CDdata {
  //MULTI SERVER INDIRECT
  // A --> interarrival
  // B --> service
  // C --> arrival
  // D --> service start
  // E --> service end
  // F --> Turn around time
  // G --> Wait in queue
  // H --> server1 utilization
  // I --> server1 utilization
  late final double A;
  late final double B;
  late final double C;
  late final double D;
  late final double E;
  late final double F;
  late final double G;
  late final double H;
  late final double I;
  CDdata(
      this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H, this.I);
}

class AppState extends ChangeNotifier {
  final List<XYDATA> MergeXY = [];
  final List<HISTDATA> histData = [];
  final List<HISTDATA_ARRIVAL> histDataArrival = [];
  final List<HISTDATA_SERVICE> histDataService = [];
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

  late double meanArrival = (double.parse(meanInterArrival.text));
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
  late double SqCoefVarArr;
  late double SqCoefVarSer;

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

  SqQuoArr(double variance1, double meanArrival) {
    SqCoefVarArr = variance1 / ((1 / meanArrival) * (1 / meanArrival));
  }

  SqQuoSer(double variance1, double meanService) {
    SqCoefVarSer = variance1 / ((meanService) * (meanService));
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

  MGwq(double avgLengthQueue_singleServer, double meanArrival) {
    avgWaitQueue_singleServer = avgLengthQueue_singleServer / meanArrival;
  }

  MGws(double avgWaitQueue_singleServer, double meanService) {
    avgWaitSys_singleServer = avgWaitQueue_singleServer + (1 / meanService);
  }

  MGwqMulti(
      double avgWaitQueue_multiServer, double SqCoefArr, double SqCoefSer) {
    avgWaitQueue_multiServer =
                       ((SqCoefArr + SqCoefSer) / 2);
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
      kendallNotation = 'M/M/$servers';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Exponential';

      multiserverRho(meanArrival, meanservice, servers);
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerLs(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);
      multiServerWs(avgWaitQueue_multiServer, meanservice);
      Ncust(multiServerUtilization);

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
      meanservice = 1 / GammaMean;
      GammaVar(maximum, minimum);
      SqQuoArr((1 / (meanArrival * meanArrival)), meanArrival);
      singleserverRho(meanArrival, meanservice);
      MGlq(meanArrival, singleServerUtilization, GammaVariance);
      MGwq(avgLengthQueue_singleServer, meanArrival);
      MGws(avgWaitQueue_singleServer, meanservice);
      MGls(meanArrival, avgWaitSys_singleServer);
      Ncust(singleServerUtilization);
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
      print(avgLengthSys_singleServer);
      kendallNotation = 'M/G/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Gamma Distribution';
    } else {
      kendallNotation = 'M/G/$servers';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Gamma Distribution';
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);
      GammaAverage(maximum, minimum);
      meanservice = 1 / GammaMean;
      GammaVar(maximum, minimum);
      SqQuoArr((1 / (meanArrival * meanArrival)), meanArrival);
      SqQuoSer(GammaVariance, (meanservice * meanservice));
      MGwqMulti(avgWaitQueue_multiServer, SqCoefVarArr, SqCoefVarSer);
      print(avgWaitQueue_multiServer);
    }
    notifyListeners();
  }

  MGUniform() {
    if (servers == 1) {
      UniformAverage(maximum, minimum);
      meanservice = 1 / UniformMean;
      UniformVar(maximum, minimum);
      singleserverRho(meanArrival, meanservice);
      MGlq(meanArrival, singleServerUtilization, UniformVariance);
      MGwq(avgLengthQueue_singleServer, meanArrival);
      MGws(avgWaitQueue_singleServer, meanservice);
      MGls(meanArrival, avgWaitSys_singleServer);
      Ncust(singleServerUtilization);
      kendallNotation = 'M/G/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Uniform ';
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
      print(avgLengthSys_singleServer);
    } else {
      kendallNotation = 'M/G/$servers';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Gamma Distribution';
      UniformAverage(maximum, minimum);
      meanservice = 1 / UniformMean;
      UniformVar(maximum, minimum);
      multiserverRho(meanArrival, meanservice, servers);
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);

      SqQuoArr((1 / (meanArrival*meanArrival)), meanArrival);
      SqQuoSer(UniformVariance, UniformMean );
      MGwqMulti(avgWaitQueue_multiServer, SqCoefVarArr, SqCoefVarSer);
      print(avgWaitQueue_multiServer);
      // print(SqCoefVarArr);
      // print(SqCoefVarSer);
      print(UniformMean);
      print(UniformVariance);
    }
    notifyListeners();
  }

  MGBeta() {
    if (servers == 1) {
      BetaAverage(maximum, minimum);
      meanservice = 1 / BetaMean;
      BetaVar(maximum, minimum);
      singleserverRho(meanArrival, meanservice);
      MGlq(meanArrival, singleServerUtilization, BetaVariance);
      MGwq(avgLengthQueue_singleServer, meanArrival);
      MGws(avgWaitQueue_singleServer, meanservice);
      MGls(meanArrival, avgWaitSys_singleServer);
      Ncust(singleServerUtilization);
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
      print(avgLengthSys_singleServer);
      kendallNotation = 'M/G/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Beta';
    } else {}
    notifyListeners();
  }

//----------------------------------------Indirect Method----------------------------//

  final List<ABdata> InterArrivalService = [];
  final List<CDdata> InterArrivalServiceMulti = [];
  List<double> InterArrivalList = [];
  List<double> ServiceList = [];
  List<double> ArrivalList = [];
  List<double> ServiceStart = [];
  List<double> ServiceEnd = [];
  List<double> Idle = [];
  List<double> TAT = [];
  List<double> WTQ = [];
  double totalArrival = 0;
  double totalService = 0;
  double totalIAT = 0;
  double totalTAT = 0;
  double totalWTQ = 0;
  double totalIdle = 0;
  double totalServer1 = 0;
  double totalServer2 = 0;
  double AvgTimeCustSpendMartSingle = 0;
  double AvgTimeCustWaitMartSingle = 0;
  double AvgTimeServiceMartSingle = 0;
  double AvgIATSingle = 0;
  double AvgWaitTimeWhoWait = 0;
  double idlePercSingle = 0;
  double utilzePercSingle = 0;
  double utilzePercServer1 = 0;
  double utilzePercServer2 = 0;

  List<double> server1 = [];
  List<double> server2 = [];

  ArrivServ() {
    //---------Arrival loop from interarrival---------//
    for (var i = 0; i < InterArrivalList.length; i++) {
      if (i == 0) {
        ArrivalList.add(InterArrivalList[i]);
      } else {
        ArrivalList.add(InterArrivalList[i] + ArrivalList[i - 1]);
      }
    }
    //----------Service start,end and idol loop------//
    for (var i = 0; i < ServiceList.length; i++) {
      if (i == 0) {
        ServiceStart.add(ArrivalList[i]);
        ServiceEnd.add(ServiceList[i]);
        Idle.add(0);
      } else {
        if (ServiceEnd[i - 1] < ArrivalList[i]) {
          ServiceStart.add(ArrivalList[i]);
          ServiceEnd.add(ArrivalList[i] + ServiceList[i]);
          Idle.add(ServiceStart[i] - ServiceEnd[i - 1]);
        } else {
          ServiceStart.add(ServiceEnd[i - 1]);
          ServiceEnd.add(ServiceStart[i] + ServiceList[i]);
          Idle.add(ServiceStart[i] - ServiceEnd[i - 1]);
        }
      }
    }
    //-------TAT,Wait in queue,Server Utilization------//

    for (var i = 0; i < ServiceList.length; i++) {
      TAT.add(ServiceEnd[i] - ArrivalList[i]);
    }
    for (var i = 0; i < ServiceList.length; i++) {
      WTQ.add(TAT[i] - ServiceList[i]);
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histData.add(HISTDATA(InterArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataArrival.add(HISTDATA_ARRIVAL(ArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataService.add(HISTDATA_SERVICE(ServiceList[i]));
    }
    // -------uploading data from list to class--------//
    for (var i = 0; i < ServiceList.length; i++) {
      InterArrivalService.add(ABdata(
          InterArrivalList[i],
          ServiceList[i],
          ArrivalList[i],
          ServiceStart[i],
          ServiceEnd[i],
          Idle[i],
          TAT[i],
          WTQ[i]));
    }
  }

  ArrivServ2() {
    //---------Arrival loop from interarrival---------//
    for (var i = 0; i < InterArrivalList.length; i++) {
      if (i == 0) {
        ArrivalList.add(InterArrivalList[i]);
      } else {
        ArrivalList.add(InterArrivalList[i] + ArrivalList[i - 1]);
      }
    }
    //----------Service start,end and servers utilization loop------//
    for (var i = 0; i < ServiceList.length; i++) {
      if (i == 0) {
        ServiceStart.add(ArrivalList[i]);
        ServiceEnd.add(ServiceList[i]);
        server1.add(ServiceList[i]);
        server2.add(0);
      } else {
        if (ServiceEnd[i - 1] > ArrivalList[i]) {
          server2.add(ServiceList[i]);
          ServiceStart.add(ArrivalList[i]);
          ServiceEnd.add(ArrivalList[i] + server2[i]);

          server1.add(0);
        } else {
          server1.add(ServiceList[i]);
          ServiceStart.add(ArrivalList[i]);
          ServiceEnd.add(ServiceStart[i] + server1[i]);

          server2.add(0);
        }
      }
    }
    //-------TAT,Wait in queue,Server Utilization------//

    for (var i = 0; i < ServiceList.length; i++) {
      TAT.add(ServiceEnd[i] - ArrivalList[i]);
    }
    for (var i = 0; i < ServiceList.length; i++) {
      WTQ.add(TAT[i] - ServiceList[i]);
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histData.add(HISTDATA(InterArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataArrival.add(HISTDATA_ARRIVAL(ArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataService.add(HISTDATA_SERVICE(ServiceList[i]));
    }
    // -------uploading data from list to class--------//
    for (var i = 0; i < ServiceList.length; i++) {
      InterArrivalServiceMulti.add(CDdata(
          InterArrivalList[i],
          ServiceList[i],
          ArrivalList[i],
          ServiceStart[i],
          ServiceEnd[i],
          TAT[i],
          WTQ[i],
          server1[i],
          server2[i]));
    }
  }

  ServiceTime() {
    ArrivServ();
    totalArrival = ArrivalList.sum;
    totalService = ServiceList.sum;
    totalIAT = InterArrivalList.sum;
    totalIdle = Idle.sum;
    totalWTQ = WTQ.sum;
    totalTAT = TAT.sum;
    AvgTimeCustSpendMartSingle = (totalTAT / ArrivalList.length);
    AvgTimeCustWaitMartSingle = (totalWTQ / ArrivalList.length);
    AvgTimeServiceMartSingle = (totalService / ArrivalList.length);
    AvgIATSingle = (totalIAT / (ArrivalList.length - 1));
    AvgWaitTimeWhoWait = (totalWTQ / (ArrivalList.length - 1));
    idlePercSingle = (totalIdle / totalService) * 100;
    utilzePercSingle = 100 - idlePercSingle;
  }

  ServiceTime2() {
    ArrivServ2();
    totalArrival = ArrivalList.sum;
    totalService = ServiceList.sum;
    totalIAT = InterArrivalList.sum;
    totalWTQ = WTQ.sum;
    totalTAT = TAT.sum;
    totalServer1 = server1.sum;
    totalServer2 = server2.sum;
    AvgTimeCustSpendMartSingle = (totalTAT / ArrivalList.length);
    AvgTimeCustWaitMartSingle = (totalWTQ / ArrivalList.length);
    AvgTimeServiceMartSingle = (totalService / ArrivalList.length);
    AvgIATSingle = (totalIAT / (ArrivalList.length - 1));
    AvgWaitTimeWhoWait = (totalWTQ / (ArrivalList.length - 1));
    utilzePercServer1 = (totalServer1 / totalService) * 100;
    utilzePercServer2 = (totalServer2 / totalService) * 100;
  }

  notifyListeners();
}
