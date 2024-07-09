import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  static const String name = 'changePassword';

  TextEditingController emailController = TextEditingController();

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

                const Text(
                  textAlign: TextAlign.left,
                  'Recuperación de contraseña',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const Text('Ingrese un correo electrónico para recibir un código de verificación.'),

                const SizedBox(height: 15,),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Correo electrónico',
                    )
                  ),

                ElevatedButton(onPressed: (){
                  String inputEmail = emailController.text;

                  if(inputEmail.isEmpty){
                    SnackBar emptyFields = SnackBar(
                      content: const Text('Ingrese su correo electrónico',
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
                  
                  if(atCount==1 && inputEmail.isEmpty == false){
                    context.push('/passwordVerificationCode');
                  }
                }, child: const Text('Enviar código')),

            ],
          ),
        )
      )
    );
  }
}