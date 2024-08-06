/*import 'package:back_on_track_app_2/firebase_auth/auth.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_home_screen.dart';
import 'package:back_on_track_app_2/firebase_auth/login_auth_screen.dart';
import 'package:back_on_track_app_2/presentations/patient/patient_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginWidgetTree extends StatefulWidget {
  const LoginWidgetTree({super.key});
  static const String name = 'loginWidgetScreen';

  @override
  State<LoginWidgetTree> createState() => _LoginWidgetTreeState();
}

class _LoginWidgetTreeState extends State<LoginWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            var user = snapshot.data;

            // Verifica que el usuario no sea null
            if (user != null) {
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .get(), // Obtiene el documento del usuario desde Firestore
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.done) {
                    if (userSnapshot.hasData && userSnapshot.data != null) {
                      var userData = userSnapshot.data!.data() as Map<String, dynamic>;
                      
                      // Verifica si el campo 'isDoctor' está presente y no es null
                      bool isDoctor = userData['isDoctor'] ?? false;

                      if (isDoctor) {
                        return DoctorHomeScreen(); // Muestra la pantalla para doctores
                      } else {
                        return PatientHomeScreen(); // Muestra la pantalla para pacientes
                      }
                    } else {
                      return const Text("No user data found.");
                    }
                  } else if (userSnapshot.hasError) {
                    return const Text("Error loading user data.");
                  } else {
                    return const CircularProgressIndicator(); // Muestra un indicador de carga mientras se obtiene el documento
                  }
                },
              );
            } else {
              return const Text("User is null.");
            }
          } else {
            // No hay datos de autenticación, muestra la pantalla de login.
            return const LoginAuthScreen();
          }
        } else if (snapshot.hasError) {
          return const Text("Error in authentication stream.");
        } else {
          // Mientras el estado de conexión no sea activo, muestra un indicador de carga o algo similar.
          return const CircularProgressIndicator();
        }
      },
    );
  }
}*/