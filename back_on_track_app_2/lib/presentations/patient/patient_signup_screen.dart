import 'package:back_on_track_app_2/presentations/patient/patient_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    ],
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

                    if(inputName.isEmpty || inputSurname.isEmpty || inputPhone.isEmpty || 
                    inputBirthYear.isEmpty || inputEmail.isEmpty || inputPswd.isEmpty ||
                    inputHeight.isEmpty || inputWeight.isEmpty || inputPreviousInfo.isEmpty){
                      
                      SnackBar emptyFields = SnackBar(
                        content: const Text('Complete todos los campos.',
                          style: TextStyle(color: Colors.black)),
                        backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(emptyFields);
                      return;
                    }

                    final phoneIsNumeric = inputPhone.runes.every((r) => r >= 48 && r <= 57);
                      if(phoneIsNumeric == false){
                        SnackBar phoneNotNumeric = SnackBar(
                        content: const Text('Número de teléfono no válido.',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(phoneNotNumeric);
                      return;
                    }

                    final birthYearIsNumeric = inputBirthYear.runes.every((r) => r >= 48 && r <= 57);
                      if(birthYearIsNumeric == false || int.parse(inputBirthYear)>=2024){
                        SnackBar birthYearNotNumeric = SnackBar(
                        content: const Text('Año de nacimiento no válido.',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(birthYearNotNumeric);
                      return;
                    }
                    
                    int atCount = '@'.allMatches(inputEmail).length;
                    if(atCount==0 || atCount > 1){
                      SnackBar wrongEmail = SnackBar(
                      content: const Text('Correo electrónico no válido.',
                          style: TextStyle(color: Colors.black)),
                      backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(wrongEmail);
                    return;
                    }

                    if(inputPswd.length<8){
                      SnackBar pswdTooShort = SnackBar(
                      content: const Text('La contraseña debe contener al menos 8 dígitos.',
                          style: TextStyle(color: Colors.black)),
                      backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(pswdTooShort);
                    return;
                    }

                    final heightIsNumeric = inputHeight.runes.every((r) => r >= 48 && r <= 57);
                      if(heightIsNumeric == false){
                        SnackBar heightNotNumeric = SnackBar(
                        content: const Text('Altura no válida.',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(heightNotNumeric);
                      return;
                    }

                    final weightIsNumeric = inputHeight.runes.every((r) => r >= 48 && r <= 57);
                      if(weightIsNumeric == false){
                        SnackBar weightIsNotNumeric = SnackBar(
                        content: const Text('Peso no válido.',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(weightIsNotNumeric);
                      return;
                    }

                    if(inputName.isEmpty == false && inputSurname.isEmpty == false &&
                    inputPhone.isEmpty == false &&  inputBirthYear.isEmpty == false && 
                    inputEmail.isEmpty == false && inputPswd.isEmpty == false &&
                    inputHeight.isEmpty == false && inputWeight.isEmpty == false &&
                    inputPreviousInfo.isEmpty == false && phoneIsNumeric && birthYearIsNumeric && 
                    int.parse(inputBirthYear)>=2024 && atCount==1 && inputPswd.length>=8 && 
                    heightIsNumeric && weightIsNumeric){
                      context.goNamed(PatientHomeScreen.name);
                    }
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