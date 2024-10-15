import 'package:back_on_track_app_2/entities/Tracking.dart';
import 'package:back_on_track_app_2/providers/tracking_provider.dart';
import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientDataScreen extends ConsumerWidget {
  static const String name = 'patientData';
  const PatientDataScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    Tracking tracking = ref.watch(trackingProvider);
    final selectedPatientId = ref.watch(selectedPatientProvider);
    ref.read(trackingProvider.notifier).getTracking(selectedPatientId);
    
    //print('TRACKING: $tracking');

    /*int timestamp = tracking.timestamp;
    DateTime second = DateTime.fromMicrosecondsSinceEpoch(timestamp);*/
  
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
      int y = tracking.kneeAngle1[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsKnee1.add(spot); 
    }

    for (var i = 0; i < tracking.kneeAngle2.length; i++) {
      int x = i;
      int y = tracking.kneeAngle2[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsKnee2.add(spot); 
    }

    for (var i = 0; i < tracking.x1.length; i++) {
      int x = i;
      int y = tracking.x1[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsx1.add(spot); 
    }

    for (var i = 0; i < tracking.y1.length; i++) {
      int x = i;
      int y = tracking.y1[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsy1.add(spot); 
    }

    for (var i = 0; i < tracking.z1.length; i++) {
      int x = i;
      int y = tracking.z1[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsz1.add(spot);
    }

    for (var i = 0; i < tracking.x2.length; i++) {
      int x = i;
      int y = tracking.x2[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsx2.add(spot); 
    }

    for (var i = 0; i < tracking.y2.length; i++) {
      int x = i;
      int y = tracking.y2[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsy2.add(spot); 
    }

    for (var i = 0; i < tracking.z2.length; i++) {
      int x = i;
      int y = tracking.z2[i];
      final spot = FlSpot(x.toDouble(), y.toDouble());

      spotsz2.add(spot); 
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Datos del paciente')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
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
                        rightTitles: AxisTitles(
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
                        rightTitles: AxisTitles(
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
                        rightTitles: AxisTitles(
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
                        rightTitles: AxisTitles(
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
                        rightTitles: AxisTitles(
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
                        rightTitles: AxisTitles(
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
                        rightTitles: AxisTitles(
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
                        rightTitles: AxisTitles(
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
    );
  }
}