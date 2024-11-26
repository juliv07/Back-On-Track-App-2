import 'package:back_on_track_app_2/entities/Tracking.dart';
import 'package:back_on_track_app_2/providers/tracking_provider.dart';
import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PatientDataScreen extends ConsumerWidget {
  static const String name = 'patientData';
  const PatientDataScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    Tracking tracking = ref.watch(trackingProvider);
    final selectedPatientId = ref.watch(selectedPatientProvider);
    ref.read(trackingProvider.notifier).getTracking(selectedPatientId);
    
    //print('TRACKING: $tracking');

    DateTime date;
    DateFormat dateFormat;
    String formattedDate;

    if(tracking.timestamp.isNotEmpty){
      int timestamp = int.parse(tracking.timestamp[tracking.timestamp.length-1]);
      date = DateTime.fromMillisecondsSinceEpoch(timestamp*1000);
      dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      formattedDate = dateFormat.format(date);
    
      if(formattedDate=='31-12-1969 21:00:00'){
        date=DateTime.now();
        formattedDate = dateFormat.format(date);
      }
    } else{
      date=DateTime.now();
      dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      formattedDate = dateFormat.format(date);
    }
  
    List<FlSpot> spotsKnee1 = [];
    List<FlSpot> spotsKnee2 = [];
    List<FlSpot> spotsx1 = [];
    List<FlSpot> spotsy1 = [];
    List<FlSpot> spotsz1 = [];
    List<FlSpot> spotsx2 = [];
    List<FlSpot> spotsy2 = [];
    List<FlSpot> spotsz2 = [];

    for (var i = 0; i < tracking.kneeAngle1.length; i++) {
      int x = i; 
      double y = double.parse(tracking.kneeAngle1[i].toString().substring(tracking.kneeAngle1[i].toString().indexOf(' ')));
      print(y);
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsKnee1.add(spot); 
    }

    for (var i = 0; i < tracking.kneeAngle2.length; i++) {
      int x = i;
      double y = double.parse(tracking.kneeAngle2[i].toString().substring(tracking.kneeAngle2[i].toString().indexOf(' ')));      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsKnee2.add(spot); 
    }

    for (var i = 0; i < tracking.x1.length; i++) {
      int x = i;
      double y = double.parse(tracking.x1[i].toString().substring(tracking.x1[i].toString().indexOf(' ')));
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsx1.add(spot); 
    }

    for (var i = 0; i < tracking.y1.length; i++) {
      int x = i;
      double y = double.parse(tracking.y1[i].toString().substring(tracking.y1[i].toString().indexOf(' ')));
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsy1.add(spot); 
    }

    for (var i = 0; i < tracking.z1.length; i++) {
      int x = i;
      double y = double.parse(tracking.z1[i].toString().substring(tracking.z1[i].toString().indexOf(' ')));
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsz1.add(spot);
    }

    for (var i = 0; i < tracking.x2.length; i++) {
      int x = i;
      double y = double.parse(tracking.x2[i].toString().substring(tracking.x2[i].toString().indexOf(' ')));
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsx2.add(spot); 
    }

    for (var i = 0; i < tracking.y2.length; i++) {
      int x = i;
      double y = double.parse(tracking.y2[i].toString().substring(tracking.y2[i].toString().indexOf(' ')));
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsy2.add(spot); 
    }

    for (var i = 0; i < tracking.z2.length; i++) {
      int x = i;
      double y = double.parse(tracking.z2[i].toString().substring(tracking.z2[i].toString().indexOf(' ')));
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsz2.add(spot); 
    }

    //print(tracking.z1);
    //print(spotsz2);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Datos del paciente')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Visibility(
                    visible: tracking.timestamp == 0,
                    child: const Text('Todavía no hay información de este paciente.')
                  ),
                  Visibility(
                    visible: tracking.timestamp != 0,
                    child: Text('Última actualidación: ${date.toString().substring(0, 19)}'), 
                  ),
                  
                  const SizedBox(height: 20),
                  const Text('Flexión rodilla 1', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsKnee1,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),
                  
                  const SizedBox(height: 30),
                  const Text('Flexión rodilla 2', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsKnee2,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),

                  const SizedBox(height: 30),
                  const Text('Inclinación cadera en eje X (1)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsx1,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),

                  const SizedBox(height: 30),
                  const Text('Inclinación cadera en eje Y (1)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsy1,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),

                  const SizedBox(height: 30),
                  const Text('Inclinación cadera en eje Z (1)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsz1,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),

                  const SizedBox(height: 30),
                  const Text('Inclinación cadera en eje X (2)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsx2,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),

                  const SizedBox(height: 30),
                  const Text('Inclinación cadera en eje Y (2)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsy2,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),

                  const SizedBox(height: 30),
                  const Text('Inclinación cadera en eje Z (2)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child:
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            show: true,
                            spots: spotsz2,
                            color: Colors.red,
                            gradient: const LinearGradient(
                              colors:[
                              Colors.red,
                              Colors.purpleAccent,
                              Colors.lightBlueAccent
                              ]
                            ),
                            barWidth: 2,
                            isCurved: true,
                            curveSmoothness: 0.4,
                            preventCurveOverShooting: true, //Que no se pueda pasar la curva de los ejes.
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            belowBarData: BarAreaData(show:true, color: Colors.blue.withOpacity(0.2)),
                            aboveBarData: BarAreaData(show:true, color: Colors.green.withOpacity(0.3)),
                          )
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            axisNameWidget: const Text('Tiempo(s)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          leftTitles: AxisTitles(
                            axisNameWidget: const Text('Ángulo(°)'),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta){
                                return Padding(
                                  padding: const EdgeInsets.only(left:1.5),
                                  child: Text(
                                    meta.formattedValue,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }
                            )
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            )
                          )
                        ),
                      )
                    )
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}