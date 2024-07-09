import 'package:back_on_track_app_2/presentations/doctor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorSignUpScreen extends StatelessWidget {
  DoctorSignUpScreen({super.key});
  static const String name = 'doctorSignup';

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController healthCenterController = TextEditingController();

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

                    context.goNamed(DoctorHomeScreen.name);
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