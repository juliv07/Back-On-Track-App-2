import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);

final trackingProvider = StateNotifierProvider<TrackingNotifier, List>((ref){


  return TrackingNotifier(FirebaseDatabase.instance.ref());
});

class TrackingNotifier extends StateNotifier<List>{

  final DatabaseReference dbRef;

  TrackingNotifier(this.dbRef) : super([]);

  List readings = [];

  Future<void> getTracking(String selectedPatientId) async{
    final snapshot = await dbRef.child('UsersData/tSPZjkhGjWVzByaU7sqR44N3sel2ukmlaNEJSykBmvygrkKm/readings').get();
    readings.add(snapshot.value);
    
    print(readings);
    
    state = readings;

  }

}

