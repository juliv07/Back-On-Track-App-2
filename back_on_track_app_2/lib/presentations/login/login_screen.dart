import 'package:back_on_track_app_2/presentations/doctor/doctor_home_screen.dart';
import 'package:back_on_track_app_2/providers/id_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class LoginScreen extends ConsumerWidget {
  static const String name = 'login';

  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  //Doctor midoctor = Doctor();

  /*List<Doctor> doctors = [
    Doctor(name: )
  ];*/

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Back On \nTrack',textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 34,
                //fontFamily: 
                ),
              ),
                      
              const SizedBox(height: 30.0),
                      
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Correo electrónico',
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 50, 143, 255),
                  )
                )
              ),

              const SizedBox(height: 30.0),
                      
              TextField(
                obscureText: true,
                controller: pswdController,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                    icon: Icon(
                      Icons.password,
                      color: Color.fromARGB(255, 50, 143, 255),
                    )
                  )
                ),

                ElevatedButton(
                  onPressed: () async {
                    String inputEmail = emailController.text;
                    String inputPassword = pswdController.text;
                      if (inputEmail.isEmpty || inputPassword.isEmpty) {
                        SnackBar emptyFields = SnackBar(
                          content: const Text('Complete todos los campos.',
                          style: TextStyle(color: Colors.black)),
                          backgroundColor:const Color.fromARGB(181, 24, 241, 107),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: const Duration(seconds: 2),
                        );
                      ScaffoldMessenger.of(context).showSnackBar(emptyFields);
                      }
                          
                      final firebaseData = await db
                      .collection('users')
                      .where('email', isEqualTo: inputEmail)
                      .where('password', isEqualTo: inputPassword)
                      .get();

                      //ref.read(idProvider.notifier).state = db.collection('users').where('email',isEqualTo: inputEmail).get();
                      //ref.read(idProvider.notifier).state = db.collection('users').doc

                      print(db.collection('users').where('email',isEqualTo: inputEmail).get());

                      if(firebaseData.docs.isNotEmpty){
                        context.pushNamed(DoctorHomeScreen.name); //goNamed
                      }

                      if(firebaseData.docs.isEmpty){
                        SnackBar wrongEmailOrPassword = SnackBar(
                          content: const Text('Usuario o contraseña incorrectos. Intente de nuevo.',
                          style: TextStyle(color: Colors.black)),
                          backgroundColor: const Color.fromARGB(181, 24, 241, 107),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(wrongEmailOrPassword);
                    }
                  },
                  child: const Text('Ingresar'),
                )
              ]
            )
          )
        )
    );  
  }
}
