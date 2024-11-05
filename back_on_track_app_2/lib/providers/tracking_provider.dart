import 'package:back_on_track_app_2/entities/Tracking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);

final trackingProvider = StateNotifierProvider<TrackingNotifier, Tracking> ((ref){

  return TrackingNotifier();
});

class TrackingNotifier extends StateNotifier<Tracking>{

  TrackingNotifier() : super(Tracking(patientId: [], timestamp: [], x1: [], y1: [], z1: [], x2: [], y2: [], z2: [], kneeAngle1: [], kneeAngle2: []));

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> getTracking(String selectedPatientId) async{

    final docs = db.collection('tracking')
    .where('patientId', arrayContains: selectedPatientId)
    .withConverter(
      fromFirestore: Tracking.fromFirestore, 
      toFirestore: (Tracking tracking,_) => tracking.toFirestore()
    );
    final reading = await docs.get();

    //print('READINGS: $readings');
    
    final readingList = reading.docs.map((d) => d.data()).toList();

    if(readingList.isEmpty){
      state =Tracking(patientId: [], timestamp: [], x1: [], y1: [], z1: [], x2: [], y2: [], z2: [], kneeAngle1: [], kneeAngle2: []);
    } else{
      state = readingList[0];
    }

    //print ('STATE: $state');

    //    timestamp   fl1  fl2  x1   y1   z1   x2   y2   z2
  }

}

