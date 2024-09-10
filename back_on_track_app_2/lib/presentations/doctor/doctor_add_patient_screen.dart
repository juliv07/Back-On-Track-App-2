import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/providers/patients_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class DoctorAddPatientScreen extends ConsumerWidget {
  static const String name = 'doctorAddPatient';
  final String searchSurname;
  DoctorAddPatientScreen({super.key, this.searchSurname = ''});

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {

    /*final patientsRef = db.collection("users").withConverter(fromFirestore: User.fromFirestore, toFirestore: (User user, _) => user.toFirestore());
    //final docSnap = patientsRef.where("isDoctor",isEqualTo: false).where("surname",isEqualTo: searchSurname).get();
    print('DOCSNAAAAAPPPP:$docSnap');*/  

    List<User>foundPatients = ref.watch(patientsProvider);
    bool mostrar = false;

    return Scaffold(
      appBar: AppBar(title: const Text('Agregar un paciente')),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  mostrar = true;
                  await ref.read(patientsProvider.notifier).getPatientsBySurname(searchSurname);
                  
                }, 
                child: const Text('Mostrar pacientes encontrados')),

              Visibility(
                visible: mostrar,
                child: Text('Pacientes encontrados con el apellido $searchSurname:'),
              ),

              Visibility( //Fijarse que pasa si esto va adentro del onPressed del botón
                visible: mostrar,
                child: ListView.builder(
                  itemCount: foundPatients.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(foundPatients[index].name),
                      subtitle: Text(foundPatients[index].surname),
                      leading: const Icon(Icons.person),
                      trailing: const Icon(Icons.add),
                    );
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
