import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/providers/patients_provider.dart';
import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorAddPatientScreen extends ConsumerStatefulWidget {
  static const String name = 'doctorAddPatient';
  const DoctorAddPatientScreen({super.key});

  @override
  ConsumerState<DoctorAddPatientScreen> createState() => _DoctorAddPatientScreenState();
}

class _DoctorAddPatientScreenState extends ConsumerState<DoctorAddPatientScreen> {
  @override
  void initState() {
    super.initState();
    final String searchSurname = ref.read(surnameProvider);
    ref.read(patientsProvider.notifier).getPatientsBySurname(searchSurname);
  }

  Widget build(BuildContext context) {

    List<User> foundPatients = ref.watch(patientsProvider);
    final String searchSurname = ref.watch(surnameProvider);
    //print('APELLIDOOO: $searchSurname');

    User currentDoctor = ref.watch(userInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Agregar un paciente')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await ref.read(patientsProvider.notifier).getPatientsBySurname(searchSurname);

                print('PACIENTEEESSS: $foundPatients');
              },    
              child: const Text('Actualizar pacientes encontrados')
            ),
            
            const SizedBox(height: 20),
            
            Text('Pacientes encontrados con el apellido $searchSurname:'),
            
            const SizedBox(height: 20),

            Expanded(
              child: foundPatients.isEmpty ? const Center(
                child: Text('No se encontraron pacientes.')
              ): 
              ListView.builder(
                itemCount: foundPatients.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(foundPatients[index].name),
                    subtitle: Text('${foundPatients[index].surname} - ${foundPatients[index].email}'),
                    leading: const Icon(Icons.person),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async {
                        await _addPatientToDoctor(foundPatients[index], currentDoctor);
                      },
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addPatientToDoctor(User patient, User currentDoctor) async {
    print('PACIENTEEE: $patient');
    FirebaseFirestore db = FirebaseFirestore.instance;

    print(currentDoctor);
    
    if(!currentDoctor.assignedPatients!.contains(patient.userId)){
      currentDoctor.assignedPatients!.add(patient.userId.toString());

      await db
      .collection('users')
      .doc(currentDoctor.userId)
      .update({'assignedPatients': currentDoctor.assignedPatients});

      setState(() {
        currentDoctor = currentDoctor; 
      });

      ref.read(userInfoProvider.notifier).state.assignedPatients = currentDoctor.assignedPatients;  
      
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${patient.name} ha sido asignado al doctor ${currentDoctor.name}.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este paciente ya está asignado a este doctor.')),
        );
      }
    
  }
}
