import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountSetting{
  String title;
  Icon leading;
  Icon trailing;
  SnackBar? snackbar;
  String? route;

  AccountSetting({
    required this.title,
    required this.leading,
    required this.trailing,
    this.snackbar,
    this.route,
  });
}

List <AccountSetting> accountSettings = [
  AccountSetting(
    title: 'Mis mediciones', 
    leading: const Icon(Icons.show_chart), 
    trailing: const Icon(Icons.arrow_forward_ios_rounded), 
    snackbar: SnackBar(
          content: const Text.rich(
            TextSpan(
              text: 'Esta función todavía no está disponible.\n',
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,), 
              children: <TextSpan>[
                TextSpan(
                  text: 'Seguimos mejorando Back On Track, próximamente vas a poder ver tus propias mediciones. Mantente atento a las novedades.',
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
    snackbar:  SnackBar(content: const Text.rich(
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
    trailing: const Icon(Icons.arrow_forward_ios_rounded), 
    route: '/logOut'
  )
];

class PatientAccountSettingsScreen extends StatelessWidget {
  const PatientAccountSettingsScreen({super.key});
  static const String name = 'patientAccountSettings';

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