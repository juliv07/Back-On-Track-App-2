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

  Future<void> getAssignedPatientsData(List<String>? assignedPatientIds) async {
    List<User> auxPatients = [];
  
    assignedPatientIds?.forEach((element) async {
      final docs = db.collection('users')
        .doc(element)
        .withConverter(
        fromFirestore: User.fromFirestore, 
        toFirestore: (User user,_) => user.toFirestore()
        );
      final auxPatient = await docs.get();
      auxPatients.add(auxPatient.data()!);
    });
    
    state = auxPatients.toList(); 
    
  }
}
    


