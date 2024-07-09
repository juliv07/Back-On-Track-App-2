import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
  static const String name = 'newPassword';

  TextEditingController pswdController = TextEditingController();
  TextEditingController repeatPswdController = TextEditingController();

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
                  'Ingrese la nueva contraseña',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 15,),

                TextField(
                  obscureText: true,
                  controller: pswdController,
                  decoration: const InputDecoration(
                    hintText: 'Nueva contraseña',
                    )
                  ),

                TextField(
                  obscureText: true,
                  controller: repeatPswdController,
                  decoration: const InputDecoration(
                    hintText: 'Confirme nueva contraseña',
                    )
                  ),

                ElevatedButton(onPressed: (){
                  String inputPswd = pswdController.text;
                  String inputRepeatPswd = repeatPswdController.text;

                  if(inputPswd.isEmpty || inputRepeatPswd.isEmpty){
                    SnackBar emptyFields = SnackBar(
                       content: const Text('Complete todos los campos',
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

                    if(inputPswd.length<8){
                      SnackBar pswdTooShort = SnackBar(
                       content: const Text('La contraseña debe tener al menos 8 caracteres',
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

                    if(inputPswd != inputRepeatPswd){
                      SnackBar pswdDontMatch = SnackBar(
                       content: const Text('Las contraseñas ingresadas no coinciden',
                        style: TextStyle(color: Colors.black)),
                        backgroundColor: const Color.fromARGB(255, 255, 251, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(pswdDontMatch);
                      return;
                    }

                    if(inputPswd.isEmpty == false && inputRepeatPswd.isEmpty == false &&
                    inputPswd.length>=8 && inputPswd == inputRepeatPswd){
                      context.push('/login');
                    }
                  }, 
                  child: const Text('Ingresar')
                ),
            ],
          ),
        )
      )
    );
  }
}
