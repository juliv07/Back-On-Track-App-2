import 'package:back_on_track_app_2/presentations/doctor/doctor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:back_on_track_app_2/entities/User.dart';

// ignore: must_be_immutable
class DoctorSignUpScreen extends StatelessWidget {
  DoctorSignUpScreen({super.key});
  static const String name = 'doctorSignup';

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController healthCenterController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false, 
      appBar: AppBar(title: const Text('Registrarse como médico'),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Información personal'),
                TextField( //NAME
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Juan',
                  )
                ),
                TextField( //SURNAME
                  controller: surnameController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                    hintText: 'Pérez',
                  )
                ),
                TextField( //PHONE
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Número de teléfono',
                    hintText: '1112345678',
                  )
                ),

                const SizedBox(height: 30.0),
                const Text('Datos de la cuenta'),

                TextField(//EMAIL
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    hintText: 'ejemplo@coreo.com',
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
                const Text('¿Dónde trabaja?'),

                TextField(//HEALTH CENTER
                  controller: healthCenterController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de la institución',
                  )
                ),

                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: (){
                    String inputName = nameController.text;
                    String inputSurname = surnameController.text;
                    String inputPhone = phoneController.text;
                    String inputEmail = emailController.text;
                    String inputPswd = pswdController.text;
                    String inputHealthCenter = healthCenterController.text;

                    if(inputName.isEmpty || inputSurname.isEmpty || inputPhone.isEmpty ||
                    inputEmail.isEmpty || inputEmail.isEmpty || inputPswd.isEmpty || 
                    inputHealthCenter.isEmpty){
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
                    
                    if(inputName.isEmpty == false && inputSurname.isEmpty == false && 
                    inputPhone.isEmpty == false && inputEmail.isEmpty == false && 
                    inputPswd.isEmpty == false && inputHealthCenter.isEmpty == false && 
                    phoneIsNumeric && atCount==1 && inputPswd.length>=8){
                      
                      final data = {
                        'isDoctor':true,
                        'name':inputName,
                        'surname':inputSurname,
                        'phone':inputPhone,
                        'email':inputEmail,
                        'password':inputPswd,
                        'healthCenter':inputHealthCenter,
                      };
                      
                      db.collection('users').add(data).then((documentSnapshot) => print("Added Data with ID: ${documentSnapshot.id}"));
                      
                      context.goNamed(DoctorHomeScreen.name);
                    }
                  }, 
                  child: const Text('Registrarse'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}