/*import 'package:back_on_track_app_2/firebase_auth/auth.dart';
import 'package:back_on_track_app_2/presentations/init/initial_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({super.key});

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async{
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
        );
    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
    }
  }

  Widget _title(){
    return const Text('Back On Track');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    ){
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
        ),
      );
    }

  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton(){
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword, 
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _registerButton(){
    return TextButton(
      onPressed: (){
        context.pushNamed(InitialScreen.name);
        }, 
      child: const Text('¿No tenés cuenta? Registrate.'));
  }

  /*Widget _forgotPasswordButton(){
    return TextButton(
      onPressed: , 
      child: const Text('Reestablecer contraseña.'))
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', emailController),
            _entryField('password', passwordController),
            _errorMessage(),
            _submitButton(),
            _registerButton(),
            
          ],
        ),
      )
    );
  }
}*/