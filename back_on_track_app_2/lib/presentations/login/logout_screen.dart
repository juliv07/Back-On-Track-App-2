import 'package:back_on_track_app_2/presentations/init/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});
  static const String name = 'logOut';

  @override
  Widget build(BuildContext context) {
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