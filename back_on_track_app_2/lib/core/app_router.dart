import 'package:back_on_track_app_2/presentations/doctor/doctor_account_settings_screen.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_edit_profile_screen.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_home_screen.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_signup_screen.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_view_patients_screen.dart';
import 'package:back_on_track_app_2/presentations/init/initial_screen.dart';
import 'package:back_on_track_app_2/presentations/login/login_screen.dart';
import 'package:back_on_track_app_2/presentations/login/logout_screen.dart';
import 'package:back_on_track_app_2/presentations/password_settings/change_password_screen.dart';
import 'package:back_on_track_app_2/presentations/password_settings/new_password_screen.dart';
import 'package:back_on_track_app_2/presentations/password_settings/password_verification_code_screen.dart';
import 'package:back_on_track_app_2/presentations/patient/patient_data_screen.dart';
import 'package:back_on_track_app_2/presentations/patient/patient_home_screen.dart';
import 'package:back_on_track_app_2/presentations/patient/patient_signup_screen.dart';
import 'package:back_on_track_app_2/presentations/init/select_type_of_user_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/patientHome",

  routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/login',
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
      path: '/initialScreen',
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

  GoRoute(
      name: DoctorEditProfileScreen.name,
      path: '/doctorEditProfile',
      builder: (context, state) =>  DoctorEditProfileScreen()
    ),
  
  GoRoute(
      name: DoctorAccountSettingsScreen.name,
      path: '/doctorAccountSettings',
      builder: (context, state) =>  DoctorAccountSettingsScreen()
    ),

  GoRoute(
      name: LogoutScreen.name,
      path: '/logOut',
      builder: (context, state) =>  LogoutScreen()
    ),

  GoRoute(
      name: DoctorViewPatientsScreen.name,
      path: '/doctorViewPatients',
      builder: (context, state) =>  DoctorViewPatientsScreen()
    ),

  GoRoute(
      name: ChangePasswordScreen.name,
      path: '/changePassword',
      builder: (context, state) =>  ChangePasswordScreen()
    ),

  GoRoute(
      name: PasswordVerificationCodeScreen.name,
      path: '/passwordVerificationCode',
      builder: (context, state) =>  PasswordVerificationCodeScreen()
    ),

  GoRoute(
      name: NewPasswordScreen.name,
      path: '/newPassword',
      builder: (context, state) =>  NewPasswordScreen()
    ),
]);
