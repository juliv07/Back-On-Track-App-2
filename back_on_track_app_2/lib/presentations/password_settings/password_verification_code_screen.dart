import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class PasswordVerificationCodeScreen extends StatelessWidget {
  PasswordVerificationCodeScreen({super.key});
  static const String name = 'passwordVerificationCode';

  TextEditingController codeController = TextEditingController();

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
                  'Ingrese el código enviado',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 15,),

                TextField(
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Código',
                    )
                  ),

                ElevatedButton(onPressed: (){
                  String inputCode = codeController.text;

                  if(inputCode.isEmpty){
                    SnackBar emptyFields = SnackBar(
                       content: const Text('Ingrese el código de verificación',
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

                  final phoneIsNumeric = inputCode.runes.every((r) => r >= 48 && r <= 57);
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
                    
                    if(phoneIsNumeric && inputCode.isEmpty == false){
                      context.push('/newPassword');
                    }
                  }, 
                  child: const Text('Verificar')
                ),
            ],
          ),
        )
      )
    );
  }
}
