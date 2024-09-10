import 'package:back_on_track_app_2/entities/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final patientsProvider = StateNotifierProvider<PatientsNotifier, List<User>>(
  (ref) => PatientsNotifier(FirebaseFirestore.instance),
);

class PatientsNotifier extends StateNotifier<List<User>>{
  final FirebaseFirestore db;

  PatientsNotifier(this.db) : super([]);

  Future<void> getPatientsBySurname(String query) async{
    final docs = db.collection('users').where('surname', isEqualTo:query ).withConverter(
      fromFirestore: User.fromFirestore, 
      toFirestore: (User user,_) => user.toFirestore());
    final users = await docs.get();
    state = users.docs.map((d) => d.data()).toList();
  }
}

