import 'package:cloud_firestore/cloud_firestore.dart';

class Tracking{
  String patientId;
  
  int timestamp;

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
        patientId: data?['patientId'], 
        timestamp: data?['timestamp'],
        x1: data?['x1'],
        y1: data?['y1'],
        z1: data?['z1'],
        x2: data?['x2'],
        y2: data?['y2'],
        z2: data?['z2'],
        kneeAngle1: data?['flex1'],
        kneeAngle2: data?['flex2'],
      );
    }
  
    Map<String, dynamic> toFirestore(){
      return{
        'patientId': patientId,
        'timestamp': timestamp,
        'x1': x1,
        'y1': y1,
        'z1': z1,
        'x2': x2,
        'y2': y2,
        'z2': z2,
        'flex1': kneeAngle1,
        'flex2': kneeAngle2,
      };
    }
}