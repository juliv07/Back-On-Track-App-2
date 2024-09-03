import 'package:back_on_track_app_2/entities/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class DoctorAddPatientScreen extends ConsumerWidget {
  static const String name = 'doctorAddPatient';
  final String searchSurname;
  DoctorAddPatientScreen({super.key, this.searchSurname = ''});

  FirebaseFirestore db = FirebaseFirestore.instance;

  List<String> foundPatients = [];

  @override
  Widget build(BuildContext context, ref) {

    final patientsRef = db.collection("users").withConverter(fromFirestore: User.fromFirestore, toFirestore: (User user, _) => user.toFirestore());

    final docSnap = patientsRef.where("isDoctor",isEqualTo: false).where("surname",isEqualTo: searchSurname).get();
  
    print('DOCSNAAAAAPPPP:$docSnap');

    

    return Scaffold(
      appBar: AppBar(title: const Text('Agregar un paciente')),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text('Pacientes encontrados con el apellido $searchSurname:'),

              /*ListView.builder(
                itemCount: ,
              )*/
            ],
          ),
        ),
      ),
    );
  }
}