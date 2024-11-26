import 'package:back_on_track_app_2/presentations/doctor/doctor_signup_screen.dart';
import 'package:back_on_track_app_2/presentations/patient/patient_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool doctor = true;

class SelectType extends StatelessWidget {
  static const String name = 'selectType';
  SelectType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse')),
      body: Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              'assets/logo3.png',
              fit: BoxFit.contain
            )
          ),

          ElevatedButton(
            onPressed: () {
              doctor = true;
              context.pushNamed(DoctorSignUpScreen.name, extra: doctor);
            },
            child: const Text('Médico'),
          ),

          //SizedBox(height: 8.0), // Esto agrega espacio vertical entre los botones
          ElevatedButton(
            onPressed: () {
              doctor = false;
              context.pushNamed(PatientSignUpScreen.name, extra: doctor);
            },
            child: const Text('Paciente'),
          ),
        ]),
      ),
    ));
  }
}
