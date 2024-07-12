import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountSetting{
  String title;
  Icon leading;
  Icon trailing;
  String route;

  AccountSetting({
    required this.title,
    required this.leading,
    required this.trailing,
    required this.route,
  });
}

List <AccountSetting> accountSettings = [
  AccountSetting(
    title: 'Datos personales', 
    leading: const Icon(Icons.badge), 
    trailing: const Icon(Icons.arrow_forward_ios_rounded), 
    route: '/patientData'),
  AccountSetting(
    title: 'Cambiar contraseña', 
    leading: const Icon(Icons.key), 
    trailing: const Icon(Icons.arrow_forward_ios_rounded), 
    route: '/changePassword'),
  AccountSetting(
    title: 'Cerrar sesión', 
    leading: const Icon(Icons.logout), 
    trailing: const Icon(Icons.arrow_forward_rounded), 
    route: '/logOut')
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
                        context.push(accountSettings[index].route);
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