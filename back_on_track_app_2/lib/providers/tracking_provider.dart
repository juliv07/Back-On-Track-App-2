import 'package:back_on_track_app_2/entities/Tracking.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);

final trackingProvider = StateNotifierProvider<TrackingNotifier, List<Tracking>>((ref){

  return TrackingNotifier(FirebaseDatabase.instance.ref());
});

class TrackingNotifier extends StateNotifier<List<Tracking>>{

  final DatabaseReference dbRef;

  TrackingNotifier(this.dbRef) : super([]);

  List readings = [];

  Future<void> getTracking(String selectedPatientId) async{
    final snapshot = await dbRef.child('UsersData/tSPZjkhGjWVzByaU7sqR44N3sel2ukmlaNEJSykBmvygrkKm/readings').get();
    readings.add(snapshot.value);
    
    print(readings);

    // id@0000000000#0000-0000-0000-0000-0000-0000-0000-0000*
    //    timestamp   fl1  fl2  x1   y1   z1   x2   y2   z2

    String readingsString = readings.toString();
    int start = readingsString.indexOf('#');

    int timestamp = int.parse(readingsString.substring(readingsString.indexOf('@'),start));
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp*1000);


    String patientId = readingsString.substring(0,start);
    
    int year = dateTime.year;
    int month = dateTime.month;
    int date = dateTime.day;
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    int second = dateTime.second;
    int millisecond = dateTime.millisecond;
    int kneeAngle1 = int.parse(readingsString.substring(start+1, start+5));
    int kneeAngle2 = int.parse(readingsString.substring(start+6, start+10));
    int x1 = int.parse(readingsString.substring(start+11, start+15));
    int y1 = int.parse(readingsString.substring(start+16, start+20));
    int z1 = int.parse(readingsString.substring(start+21, start+25));
    int x2 = int.parse(readingsString.substring(start+26, start+30));
    int y2 = int.parse(readingsString.substring(start+31, start+35));
    int z2 = int.parse(readingsString.substring(start+36, start+40));
    
    Tracking tracking = Tracking(patientId: patientId, year: year, month: month, date: date, hour: hour, minute: minute, second: second, millisecond: millisecond, kneeAngle1: kneeAngle1, kneeAngle2: kneeAngle2, x1: x1, y1: y1, z1: z1, x2: x2, y2: y2, z2: z2);

    List<Tracking> trackingList = [];

    trackingList.add(tracking);

    state = trackingList;

  }

}

