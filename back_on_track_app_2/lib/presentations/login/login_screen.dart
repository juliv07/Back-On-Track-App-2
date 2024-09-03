import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_home_screen.dart';
import 'package:back_on_track_app_2/presentations/patient/patient_home_screen.dart';
import 'package:back_on_track_app_2/providers/userDataProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPasswordVisibilityNotifier extends StateNotifier<bool> {
  LoginPasswordVisibilityNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}

final loginPasswordVisibilityProvider = StateNotifierProvider<LoginPasswordVisibilityNotifier, bool>((ref) {
  return LoginPasswordVisibilityNotifier();
});

// ignore: must_be_immutable
class LoginScreen extends ConsumerWidget {
  static const String name = 'login';

  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey, 
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
                        
                TextFormField(
                  focusNode: focusNode1,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Correo electrónico',
                    icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 50, 143, 255),
                    )
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } else if (value.contains('@')==false || '@'.allMatches(value).length > 1){
                        return 'Ingrese un correo elecrónico válido';
                      }
                      return null; // Devuelve null si no hay error
                    },
                ),

                const SizedBox(height: 30.0),
                        
                TextFormField(
                  focusNode: focusNode2,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focusNode3);
                  },
                  obscureText: ref.watch(loginPasswordVisibilityProvider),
                  controller: pswdController,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                      icon: const Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 50, 143, 255),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          ref.watch(loginPasswordVisibilityProvider)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          ref.read(loginPasswordVisibilityProvider.notifier).toggle();
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  ElevatedButton(
                    focusNode: focusNode3,
                    onPressed: () async {
                  
                      if (_formKey.currentState?.validate() ?? false) {
                        String inputEmail = emailController.text;
                        String inputPassword = pswdController.text;
                            
                        final firebaseData = await db
                        .collection('users')
                        .where('email', isEqualTo: inputEmail)
                        .where('password', isEqualTo: inputPassword)
                        .get();

                        ref.read(emailProvider.notifier).state = inputEmail;

                        if(firebaseData.docs.isNotEmpty){
                          DocumentSnapshot doc = firebaseData.docs.first;
                          var data = doc.data() as Map<String, dynamic>;
                          
                          String userIdFromDB = data['userId'];
                          bool isDoctorFromDB = data['isDoctor'];
                          String nameFromDB = data['name'] ?? 'No disponible';
                          String surnameFromDB = data['surname'] ?? 'No disponible';
                          String emailFromDB = data['email'] ?? 'No disponible';
                          String phoneFromDB = data['phone'] ?? 'No disponible';
                          String passwordFromDB = data['password'] ?? 'No disponible';
                          String assignedDoctorFromDB = data['assignedDoctor'] ?? 'No disponible';
                          int birthYearFromDB = int.tryParse(['birthYear'].toString()) ?? 0;
                          double heightFromDB = double.tryParse(['height'].toString()) ?? 0.0;
                          double weightFromDB = double.tryParse(data['weight'].toString()) ?? 0.0;
                          String previousInfoFromDB = data['previousInfo'] ?? 'No disponible';
                          List<String> assignedPatientsFromDB = [];
                          if (data['assignedPatients'] != null) {
                              assignedPatientsFromDB = List<String>.from(data['assignedPatients']);
                            }  else {
                            // Valor por defecto si el campo no está presente
                            assignedPatientsFromDB = ['No disponible'];
                          }
                          String healthCenterFromDB = data['healthCenter'] ?? 'No disponible';
                          
                          if(isDoctorFromDB){
                            ref.read(userInfoProvider.notifier).state =
                              User(
                                userId: userIdFromDB,
                                isDoctor: isDoctorFromDB, 
                                name: nameFromDB, 
                                surname: surnameFromDB, 
                                email: emailFromDB, 
                                password: passwordFromDB, 
                                phone: phoneFromDB, 
                                assignedPatients: assignedPatientsFromDB, 
                                healthCenter: healthCenterFromDB
                            );
                            context.pushNamed(DoctorHomeScreen.name);
                          }
                          else{
                            ref.read(userInfoProvider.notifier).state =
                              User(
                                userId: userIdFromDB,
                                isDoctor: isDoctorFromDB, 
                                name: nameFromDB, 
                                surname: surnameFromDB, 
                                email: emailFromDB, 
                                password: passwordFromDB, 
                                phone: phoneFromDB, 
                                assignedDoctor: assignedDoctorFromDB,
                                birthYear: birthYearFromDB,
                                height: heightFromDB,
                                weight: weightFromDB,
                                previousInfo: previousInfoFromDB
                            );
                            context.pushNamed(PatientHomeScreen.name);
                          } //goNamed
                        }

                        if(firebaseData.docs.isEmpty){
                          SnackBar wrongEmailOrPassword = SnackBar(
                            content: const Text('Usuario o contraseña incorrectos. Intente de nuevo.',
                            style: TextStyle(color: Colors.black)),
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: const Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(wrongEmailOrPassword);
                        }
                      }
                    },
                    child: const Text('Ingresar'),
                  )
                ]
              )
            )
          )
      ),
    );  
  }
}

Future<void> guardarUsuario(String id, String nombre, int edad, double altura) async {
  try {
    await db.collection('users').doc(id).set({
      'nombre': nombre,
      'edad': edad,
      'altura': altura,
    });
    print('Usuario guardado con éxito');
  } catch (e) {
    print('Error al guardar usuario: $e');
  }
} 
