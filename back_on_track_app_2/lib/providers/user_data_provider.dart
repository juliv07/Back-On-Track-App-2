import 'package:back_on_track_app_2/entities/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FirebaseFirestore db = FirebaseFirestore.instance;


StateProvider<String> emailProvider = StateProvider((ref) => '');

StateProvider<User> userInfoProvider = StateProvider((ref) => User(userId: '', isDoctor: false, name: '', surname: '', email: '', password: '', phone: '', assignedPatients: [], birthYear: 0));

StateProvider<String> selectedPatientProvider = StateProvider((ref) => '');