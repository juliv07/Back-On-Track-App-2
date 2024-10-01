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

    final tracking = ref.watch(trackingProvider);

    final selectedPatientId = ref.watch(selectedPatientProvider);

    ref.read(trackingProvider.notifier).getTracking(selectedPatientId);

    print(tracking);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Datos del paciente')),
        body: Center(
          child: AspectRatio(
            aspectRatio: 1.1,
            child:
            LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    show: true,
                    spots: const[
                      FlSpot(0, 0),
                      FlSpot(1, 2),
                      FlSpot(2, 1.5),
                      FlSpot(3, 3),
                      FlSpot(5, 1),
                      FlSpot(6, 2),
                      FlSpot(8, 0.5),
                      FlSpot(10, 2.5),
                    ],
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
                    axisNameWidget: const Text('Tiempo(ms)'),
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
        ),
      ),
    );
  }
}