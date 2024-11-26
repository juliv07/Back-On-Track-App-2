import 'package:back_on_track_app_2/presentations/login/login_screen.dart';
import 'package:back_on_track_app_2/presentations/init/select_type_of_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends StatelessWidget {
  static const String name = 'initialScreen';
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: Image.asset(
                'assets/logo3.png',
                fit: BoxFit.contain
              )
            ),
            
            ElevatedButton(
                onPressed: () {
                  context.pushNamed(LoginScreen.name);
                },
                child: const Text('Iniciar sesión')),
            ElevatedButton(
                onPressed: () {
                  context.pushNamed(SelectType.name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white
                ),
                child: const Text('Registrarse')
                ),
          ],
        ),
      ),
    );
  }
}
