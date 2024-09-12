import 'package:back_on_track_app_2/entities/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<String> surnameProvider = StateProvider((ref) => ''); 

final patientsProvider = StateNotifierProvider<PatientsNotifier, List<User>>(
  (ref) => PatientsNotifier(FirebaseFirestore.instance),
);

class PatientsNotifier extends StateNotifier<List<User>>{
  final FirebaseFirestore db;

  PatientsNotifier(this.db) : super([]);

  Future<void> getPatientsBySurname(String query) async{
    final docs = db.collection('users')
      .where('surname', isEqualTo: query)
      .where('isDoctor', isEqualTo: false)
      .withConverter(
        fromFirestore: User.fromFirestore, 
        toFirestore: (User user,_) => user.toFirestore()
      );
    final users = await docs.get();
    state = users.docs.map((d) => d.data()).toList();
  }

  Future<List<User>> getAssignedPatientsData(List<String>? assignedPatientIds) async {
  List<User> patientNames = [];

  // Iterate through the list of assigned patient IDs
  for (String patientId in assignedPatientIds!) {
    // Get a reference to the patient document
    DocumentSnapshot patientDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(patientId)
        .get();

    // Check if the document exists
    if (patientDoc.exists) {
      // Get the patient's name from the document
      String patientName = patientDoc.get('name');
      String patientSurname = patientDoc.get('surname');
      String patientEmail = patientDoc.get('email');
      patientNames.add(User(userId: patientId, isDoctor: false, name: patientName, surname: patientSurname, email: patientEmail, password: 'pswd', phone: 'phone'));
    } else {
      // Handle the case where the patient document doesn't exist
      print('Patient document not found for ID: $patientId');
    }
  }

  return patientNames;
}
    


}

