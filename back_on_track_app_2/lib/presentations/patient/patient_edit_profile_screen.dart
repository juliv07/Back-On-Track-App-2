import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class PatientEditProfileScreen extends ConsumerWidget {
  PatientEditProfileScreen({super.key});
  static const String name = 'patientEditProfile';

  @override
  Widget build(BuildContext context, ref) {

     User user = ref.watch(userInfoProvider);

    List <ProfileSetting> profileSettings = [
      ProfileSetting(
        title: 'Nombre', 
        subtitle: '${user.name} ${user.surname}', 
        trailing: const Icon(Icons.edit), 
        route: '/editName'
        ),
      ProfileSetting(
        title: 'Email', 
        subtitle: user.email, 
        trailing: const Icon(Icons.edit), 
        route: '/editEmail'
        ),
      ProfileSetting(
        title: 'Teléfono', 
        subtitle: user.phone, 
        trailing: const Icon(Icons.edit), 
        route: '/editPhone'
        ),
      ProfileSetting(
        title: 'Antecedentes', 
        subtitle: user.previousInfo??'No tiene', 
        trailing: const Icon(Icons.edit), 
        route: '/editPreviousInfo'
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Editar perfil')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 150, color: Colors.lightBlue,),
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
                          SnackBar featureNotAvailable = SnackBar(
                            content: const Text.rich(
                              TextSpan(
                                text: 'Esta función todavía no está disponible.\n',
                                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,), 
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Seguimos mejorando Back On Track, próximamente vas a poder editar tu perfil cuando quieras. Mantente atento a las novedades.',
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
                        );
                        ScaffoldMessenger.of(context).showSnackBar(featureNotAvailable);
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