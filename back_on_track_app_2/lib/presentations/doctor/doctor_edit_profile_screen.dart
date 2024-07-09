import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSetting{
    String title;
    String subtitle;
    Icon trailing;
    String route;

    ProfileSetting({
      required this.title,
      required this.subtitle,
      required this.trailing,
      required this.route,
    });
  }

List <ProfileSetting> profileSettings = [
  ProfileSetting(title: 'Nombre', subtitle: 'Dr. Nefario', trailing: const Icon(Icons.edit), route: '/editName'),
  ProfileSetting(title: 'Institución', subtitle: 'Hospital Italiano', trailing: const Icon(Icons.edit), route: '/editInfo'),
];

class DoctorEditProfileScreen extends StatelessWidget {
  const DoctorEditProfileScreen({super.key});
  static const String name = 'doctorEditProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar perfil')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 120,
                backgroundImage: NetworkImage('https://nationaleczema.org/wp-content/uploads/2019/01/shutterstock_624008096.jpg')
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: profileSettings.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 194, 245, 255),
                      child: ListTile(
                        title: Text(profileSettings[index].title,
                        style: const TextStyle(fontSize: 20)),
                        subtitle: Text(profileSettings[index].subtitle),
                        trailing: profileSettings[index].trailing,
                        onTap: () {
                          context.push(profileSettings[index].route);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        )
      )
    );
  }
}