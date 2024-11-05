import 'package:cloud_firestore/cloud_firestore.dart';

class Tracking{
  List patientId;
  
  List timestamp;

  List z1; //roll
  List z2;
  List y1; //pitch
  List y2;
  List x1; //yaw
  List x2;

  List kneeAngle1;
  List kneeAngle2;

  Tracking({
    required this.patientId,
    required this.timestamp,
    required this.x1,
    required this.y1,
    required this.z1,
    required this.x2,
    required this.y2,
    required this.z2,
    required this.kneeAngle1,
    required this.kneeAngle2,
  });

  factory Tracking.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
    ){
      final data = snapshot.data();
      return Tracking(
        patientId: data?['patientId'] ?? [],
        timestamp: data?['timeStamp'] ?? [],

        x1: data?['valoresX1'] ?? [],
        y1: data?['valoresy1'] ?? [],
        z1: data?['valoresz1'] ?? [],
        x2: data?['valoresX2'] ?? [],
        y2: data?['valoresy2'] ?? [],
        z2: data?['valoresz2'] ?? [],
        kneeAngle1: data?['valoresFlex1'] ?? [],
        kneeAngle2: data?['valoresFlex2'] ?? [],
      );
    }
  
    Map<String, dynamic> toFirestore(){
      return{
        'patientId': patientId,
        'timeStamp': timestamp,
        'valoresX1': x1,
        'valoresy1': y1,
        'valoresz1': z1,
        'valoresX2': x2,
        'valoresy2': y2,
        'valoresz2': z2,
        'valoresFlex1': kneeAngle1,
        'valoresFlex2': kneeAngle2,
      };
    }
}