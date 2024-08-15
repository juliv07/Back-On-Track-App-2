import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/presentations/init/initial_screen.dart';
import 'package:back_on_track_app_2/providers/userDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogoutScreen extends ConsumerWidget {
  const LogoutScreen({super.key});
  static const String name = 'logOut';

  @override
  Widget build(BuildContext context,ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
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

              const Text('¿Estás seguro que querés cerrar sesión?'),
              ElevatedButton(onPressed: (){
                ref.read(userInfoProvider.notifier).state = User(
                  isDoctor: false, 
                  name: '', 
                  surname: '', 
                  email: '', 
                  password: '', 
                  phone: '', 
                  assignedDoctor: '', 
                  birthYear: 0, 
                  height: 0.0, 
                  weight: 0.0, 
                  previousInfo: '', 
                  assignedPatients: [], 
                  healthCenter: ''
                );
                context.goNamed(InitialScreen.name);
                }, 
                child: const Text('Sí')),
            ],
          ),
        ),
      ),
    );
  }
}