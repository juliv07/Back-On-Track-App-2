import 'package:back_on_track_app_2/presentations/patient_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientSignUpScreen extends StatelessWidget {
  static const String name = 'patientSignup';
  PatientSignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthYearController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController previousInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse como paciente'),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Información personal'),
                TextField(//NAME
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Juan',
                  )
                ),
                TextField(//SURNAME
                  controller: surnameController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                    hintText: 'Pérez',
                  )
                ),
                TextField(//PHONE
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Número de teléfono',
                    hintText: '1112345678',
                  )
                ),
                TextField(//BIRTH YEAR
                  controller: birthYearController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Año de nacimiento',
                    hintText: '1978',
                  )
                ),

                const SizedBox(height: 30.0),
                const Text('Datos de la cuenta'),

                TextField(//EMAIL
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    hintText: 'ejemplo@correo.com',
                  )
                ),
                TextField(//PASSWORD
                  controller: pswdController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  )
                ),

                const SizedBox(height: 30.0),
                const Text('Información médica'),

                TextField(//HEIGHT
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(//
                    labelText: 'Altura (cm)',
                    hintText: '174',
                  )
                ),
                TextField(//WEIGHT
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(//
                    labelText: 'Peso (kg)',
                    hintText: '65',
                  )
                ),
                TextField(//PREVIOUS INFORMTION
                  controller: previousInfoController,
                  decoration: const InputDecoration(//
                    labelText: 'Historial previo',
                  )
                ),

                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: (){
                    String inputName = nameController.text;
                    String inputSurname = surnameController.text;
                    String inputPhone = phoneController.text;
                    String inputBirthYear = birthYearController.text; 
                    String inputEmail = emailController.text;
                    String inputPswd = pswdController.text;
                    String inputHeight = heightController.text;
                    String inputWeight = weightController.text;
                    String inputPreviousInfo = previousInfoController.text;

                    context.goNamed(PatientHomeScreen.name);
                  }, 
                  child: const Text('Registrarse'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}