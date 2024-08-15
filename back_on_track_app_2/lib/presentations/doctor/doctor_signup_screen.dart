import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_home_screen.dart';
import 'package:back_on_track_app_2/providers/userDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorPasswordVisibilityNotifier extends StateNotifier<bool> {
  DoctorPasswordVisibilityNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}

final doctorPasswordVisibilityProvider = StateNotifierProvider<DoctorPasswordVisibilityNotifier, bool>((ref) {
  return DoctorPasswordVisibilityNotifier();
});

// ignore: must_be_immutable
class DoctorSignUpScreen extends ConsumerWidget {
  DoctorSignUpScreen({super.key});
  static const String name = 'doctorSignup';

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController healthCenterController = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode5 = FocusNode();
  final focusNode6 = FocusNode();
  final focusNode7 = FocusNode();

  final _formKey = GlobalKey<FormState>();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context,ref) {

    final isNumeric = RegExp(r'^[0-9]+$');

    return Scaffold(
      //resizeToAvoidBottomInset: false, 
      appBar: AppBar(title: const Text('Registrarse como médico'),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Información personal'),
                  TextFormField( //NAME
                    focusNode: focusNode1,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode2);
                    },
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Juan',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),
                  TextFormField( //SURNAME
                    focusNode: focusNode2,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode3);
                    },
                    controller: surnameController,
                    decoration: const InputDecoration(
                      labelText: 'Apellido',
                      hintText: 'Pérez',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),
                  TextFormField( //PHONE
                    focusNode: focusNode3,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode4);
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Número de teléfono',
                      hintText: '1112345678',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } else if (isNumeric.hasMatch(value)==false){
                        return 'El número de teléfono no puede contener símbolos o letras';
                      }
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  const SizedBox(height: 30.0),
                  const Text('Datos de la cuenta'),

                  TextFormField(//EMAIL
                    focusNode: focusNode4,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode5);
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      hintText: 'ejemplo@coreo.com',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      }
                      else if (value.contains('@')==false || '@'.allMatches(value).length > 1){
                        return 'Ingrese un correo elecrónico válido';
                      }
                      return null; // Devuelve null si no hay error
                    },
                  ),
                  TextFormField(//PASSWORD
                    focusNode: focusNode5,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode6);
                    },
                    controller: pswdController,
                    obscureText: ref.watch(doctorPasswordVisibilityProvider),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(
                          ref.watch(doctorPasswordVisibilityProvider)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          ref.read(doctorPasswordVisibilityProvider.notifier).toggle();
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } else if (value.length<8){
                        return 'La contraseña debe contener más de 8 caracteres';
                      }
                      return null; // Devuelve null si no hay error
                    },
                  ),
                  
                  const SizedBox(height: 30.0),
                  const Text('¿Dónde trabaja?'),

                  TextFormField(//HEALTH CENTER
                    focusNode: focusNode6,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode7);
                    },
                    controller: healthCenterController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre de la institución',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    focusNode: focusNode7,
                    onPressed: (){
                    
                     if (_formKey.currentState?.validate() ?? false) {
                        
                        final data = {
                          'isDoctor':true,
                          'name':nameController.text,
                          'surname':surnameController.text,
                          'phone':phoneController.text,
                          'email':emailController.text,
                          'password':pswdController.text,
                          'healthCenter':healthCenterController.text,
                        };
                        
                        db.collection('users').add(data).then((documentSnapshot) => print("Added Data with ID: ${documentSnapshot.id}"));
                        ref.read(userInfoProvider.notifier).state =
                          User(
                          isDoctor:true,
                          name:nameController.text,
                          surname:surnameController.text,
                          phone:phoneController.text,
                          email:emailController.text,
                          password:pswdController.text,
                          healthCenter:healthCenterController.text,       
                        );
                        context.goNamed(DoctorHomeScreen.name);
                      }
                    }, 
                    child: const Text('Registrarse'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}