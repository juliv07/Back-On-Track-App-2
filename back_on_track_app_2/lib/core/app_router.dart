import 'package:back_on_track_app_2/presentations/doctor_home_screen.dart';
import 'package:back_on_track_app_2/presentations/doctor_signup_screen.dart';
import 'package:back_on_track_app_2/presentations/initial_screen.dart';
import 'package:back_on_track_app_2/presentations/login_screen.dart';
import 'package:back_on_track_app_2/presentations/patient_data.dart';
import 'package:back_on_track_app_2/presentations/patient_home_screen.dart';
import 'package:back_on_track_app_2/presentations/patient_signup_screen.dart';
import 'package:back_on_track_app_2/presentations/select_type_of_user_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  //initialLocation: "/initialScreen",

  routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/loginScreen',
    builder: (context, state) => LoginScreen(),
  ),

  GoRoute(
      name: DoctorHomeScreen.name,
      path: '/doctorHome',
      builder: (context, state) => const DoctorHomeScreen(),
    ),

  GoRoute(
      name: PatientHomeScreen.name,
      path: '/patientHome',
      builder: (context, state) => const PatientHomeScreen()//doctor: state.extra as bool)
    ),

  GoRoute(
      name: SelectType.name,
      path: '/selectType',
      builder: (context, state) => SelectType()
    ),

  GoRoute(
      name: PatientDataScreen.name,
      path: '/patientData',
      builder: (context, state) => const PatientDataScreen()
    ),
  
  GoRoute(
      name: InitialScreen.name,
      path: '/',
      builder: (context, state) => const InitialScreen()
    ),

  GoRoute(
      name: DoctorSignUpScreen.name,
      path: '/doctorSignup',
      builder: (context, state) => DoctorSignUpScreen()
    ),

  GoRoute(
      name: PatientSignUpScreen.name,
      path: '/patientSignup',
      builder: (context, state) =>  PatientSignUpScreen()
    ),
]);
