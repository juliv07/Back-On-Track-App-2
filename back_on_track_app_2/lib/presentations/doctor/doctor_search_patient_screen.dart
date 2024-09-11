import 'package:back_on_track_app_2/presentations/doctor/doctor_add_patient_screen.dart';
import 'package:back_on_track_app_2/providers/patients_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class DoctorSearchPatientScreen extends ConsumerWidget {
  DoctorSearchPatientScreen({super.key});
  static const String name = 'doctorSearchPatient';

  TextEditingController patientNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar un paciente')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children: [
            Form(
              key: _formKey,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: patientNameController,
                    decoration: const InputDecoration(
                      label: Text('Ingrese el apellido del paciente'),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState?.validate() ?? false) {
                        final String searchSurname = patientNameController.text;
                        ref.read(surnameProvider.notifier).state = searchSurname;
                        context.pushNamed(DoctorAddPatientScreen.name);
                        }
                      },
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ],
          ),
    
        )
      ),    
    );
  }
}