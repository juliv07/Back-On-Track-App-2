import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/presentations/patient/patient_home_screen.dart';
import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PasswordVisibilityNotifier extends StateNotifier<bool> {
  PasswordVisibilityNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}

final passwordVisibilityProvider = StateNotifierProvider<PasswordVisibilityNotifier, bool>((ref) {
  return PasswordVisibilityNotifier();
});

// ignore: must_be_immutable
class PatientSignUpScreen extends ConsumerWidget {
  static const String name = 'patientSignup';
  PatientSignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthYearController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController previousInfoController = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode5 = FocusNode();
  final focusNode6 = FocusNode();
  final focusNode7 = FocusNode();
  final focusNode8 = FocusNode();
  final focusNode9 = FocusNode();
  final focusNode10 = FocusNode();

  final _formKey = GlobalKey<FormState>();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {

    final isNumeric = RegExp(r'^[0-9]+$');
    final isNumericAndDot = RegExp(r'^[0-9]*\.?[0-9]+$');

    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse como paciente'),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              //autovalidateMode: AutovalidateMode.onUserInteraction, // Activar la validación automática al interactuar
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Información personal'),
                  TextFormField(//NAME
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
                  TextFormField(//SURNAME
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
                  TextFormField(//PHONE
                    focusNode: focusNode3,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode4);
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      ],
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
                  TextFormField(//BIRTH YEAR
                    focusNode: focusNode4,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode5);
                    },
                    controller: birthYearController,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Año de nacimiento',
                      hintText: '1978',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } else if (isNumeric.hasMatch(value)==false || int.parse(value)>=2024 || int.parse(value)<1900){
                        return 'Ingrese un año válido';
                      }
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  const SizedBox(height: 30.0),
                  const Text('Datos de la cuenta'),

                  TextFormField(//EMAIL
                    focusNode: focusNode5,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode6);
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      hintText: 'ejemplo@correo.com',
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
                    focusNode: focusNode6,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode7);
                    },
                    controller: pswdController,
                    obscureText: ref.watch(passwordVisibilityProvider),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(
                          ref.watch(passwordVisibilityProvider)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          ref.read(passwordVisibilityProvider.notifier).toggle();
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
                  const Text('Información médica'),

                  TextFormField(//HEIGHT
                    focusNode: focusNode7,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode8);
                    },
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(//
                      labelText: 'Altura (cm)',
                      hintText: '174',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } else if (value.contains(',')){
                        return "Ingrese los decimales con un punto. Ej: '174.5'";
                      } else if (double.parse(value)>250 || double.parse(value)<60){
                        return 'Ingrese una altura válida';
                      } else if (isNumericAndDot.hasMatch(value)==false){
                        return 'La altura no puede contener símbolos o letras';
                      }
                      return null; // Devuelve null si no hay error
                    },
                  ),
                  TextFormField(//WEIGHT
                    focusNode: focusNode8,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode9);
                    },
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(//
                      labelText: 'Peso (kg)',
                      hintText: '65',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } else if (value.contains(',')){
                        return "Ingrese los decimales con un punto. Ej: '65.8'";
                      } else if (isNumericAndDot.hasMatch(value)==false){
                        return 'El peso no puede contener símbolos o letras';
                      } else if (double.parse(value) > 250 || double.parse(value)<10){
                        return 'Ingrese un peso válido';
                      }
                      return null; // Devuelve null si no hay error
                    },
                  ),
                  TextFormField(//PREVIOUS INFORMTION
                    focusNode: focusNode9,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode10);
                    },
                    controller: previousInfoController,
                    decoration: const InputDecoration(//
                      labelText: 'Historial previo',
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
                    focusNode: focusNode10,
                    onPressed: (){
                      
                      if (_formKey.currentState?.validate() ?? false) {

                        final newUserRef = db.collection("users").doc();

                        final data = {
                          'userId': newUserRef.id,
                          'isDoctor':false,
                          'name':nameController.text,
                          'surname':surnameController.text,
                          'phone':phoneController.text,
                          'birthYear':birthYearController.text,
                          'email':emailController.text,
                          'password':pswdController.text,
                          'height':heightController.text,
                          'weight':weightController.text,
                          'previousInfo':previousInfoController.text,                        
                        };
                        
                        newUserRef.set(data).then((documentSnapshot) => print("Added Data with ID: ${newUserRef.id}"));
                        
                        ref.read(userInfoProvider.notifier).state = User(
                          userId: newUserRef.id,
                          isDoctor:false,
                          name:nameController.text,
                          surname:surnameController.text,
                          phone:phoneController.text,
                          birthYear: int.parse(birthYearController.text),
                          email:emailController.text,
                          password:pswdController.text,
                          height: double.parse(heightController.text),
                          weight: double.parse(weightController.text),
                          previousInfo:previousInfoController.text,    
                        );                      

                        context.goNamed(PatientHomeScreen.name);
                      }
                    }, 
                    child: const Text('Registrarse'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}