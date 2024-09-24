import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<String> surnameProvider = StateProvider((ref) => ''); 

final patientsProvider = StateNotifierProvider<PatientsNotifier, List<User>>(
(ref) {
  
  final userInfo = ref.read(userInfoProvider);
  return PatientsNotifier(FirebaseFirestore.instance, userInfo);
  
  }
);

class PatientsNotifier extends StateNotifier<List<User>>{
  final FirebaseFirestore db;

  User userInfo;

  PatientsNotifier(this.db,  this.userInfo) : super([]);

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

  Future<void> getAssignedPatientsData() async {

    List<String>? assignedPatientIds = userInfo.assignedPatients;

    final docs = db.collection('users').withConverter(
      fromFirestore: User.fromFirestore, 
      toFirestore: (User user, _) => user.toFirestore());

    final users = await docs.get();

    List<User> usersList = users.docs.map((d)=>d.data()).toList();

    List<User> auxPatients = usersList.where((user) {
      return assignedPatientIds?.contains(user.userId) ?? false;
    }).toList();
    
    state = auxPatients; 
  }
}
    


