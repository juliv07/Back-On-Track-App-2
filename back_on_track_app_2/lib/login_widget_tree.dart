import 'package:back_on_track_app_2/auth.dart';
import 'package:back_on_track_app_2/presentations/login/login_auth_screen.dart';
import 'package:flutter/material.dart';

class LoginWidgetTree extends StatefulWidget {
  const LoginWidgetTree({super.key});
  static const String name = 'loginWidgetScreen';

  @override
  State<LoginWidgetTree> createState() => _LoginWidgetTreeState();
}

class _LoginWidgetTreeState extends State<LoginWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot){
        //hacer que si es doctor mande a la home del doctor y si es paciente mande a la del paciente
        //agregar signout en las homes con auth
        //el resto debería funcionar
        else{
          return const LoginAuthScreen();
        }
      } ,
    );
  }
}