import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountSetting{
  String title;
  Icon leading;
  Icon trailing;
  String? route;
  SnackBar? snackbar;

  AccountSetting({
    required this.title,
    required this.leading,
    required this.trailing,
    this.route,
    this.snackbar,
  });
}

List <AccountSetting> accountSettings = [
  AccountSetting(
    title: 'Datos personales', 
    leading: const Icon(Icons.badge), 
    trailing: const Icon(Icons.arrow_forward_ios_rounded), 
    //route: '/doctorData',
    snackbar: SnackBar(
          content: const Text.rich(
            TextSpan(
              text: 'Esta función todavía no está disponible.\n',
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,), 
              children: <TextSpan>[
                TextSpan(
                  text: 'Seguimos mejorando Back On Track, próximamente vas a poder ver tus datos personales. Mantente atento a las novedades.',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.yellow,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 5),
      ),  
  ), 
  AccountSetting(
    title: 'Cambiar contraseña', 
    leading: const Icon(Icons.key), 
    trailing: const Icon(Icons.arrow_forward_ios_rounded), 
    //route: '/changePassword',
    snackbar: SnackBar(
          content: const Text.rich(
            TextSpan(
              text: 'Esta función todavía no está disponible.\n',
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,), 
              children: <TextSpan>[
                TextSpan(
                  text: 'Seguimos mejorando Back On Track, próximamente vas a poder cambiar tu contraseña. Mantente atento a las novedades.',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.yellow,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 5),
      ),
  ),
  AccountSetting(
    title: 'Cerrar sesión', 
    leading: const Icon(Icons.logout), 
    trailing: const Icon(Icons.arrow_forward_rounded), 
    route: '/logOut'
  ),
];

class DoctorAccountSettingsScreen extends StatelessWidget {
  const DoctorAccountSettingsScreen({super.key});
  static const String name = 'doctorAccountStettings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes de cuenta'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
              child: ListView.builder(
                itemCount: accountSettings.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 194, 245, 255),
                    child: ListTile(
                      title: Text(accountSettings[index].title,
                      style: const TextStyle(fontSize: 20)),
                      leading: accountSettings[index].leading,
                      trailing: accountSettings[index].trailing,
                      onTap: () {
                        if(accountSettings[index].route != null){
                          context.push(accountSettings[index].route.toString());
                        } else{
                          ScaffoldMessenger.of(context).showSnackBar(accountSettings[index].snackbar!);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}