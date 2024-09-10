import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class DoctorEditProfileScreen extends ConsumerWidget {
  DoctorEditProfileScreen({super.key});
  static const String name = 'doctorEditProfile';

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {

    String nameAndSurname = ('${ref.watch(userInfoProvider).name} ${ref.watch(userInfoProvider).surname}');


    List <ProfileSetting> profileSettings = [
      ProfileSetting(
        title: 'Nombre', 
        subtitle: nameAndSurname, 
        trailing: const Icon(Icons.edit), 
        route: '/editName'),

      ProfileSetting (
        title: 'Institución', 
        subtitle: ref.watch(userInfoProvider).healthCenter ?? '',
        trailing: const Icon(Icons.edit), 
        route: '/editInfo'),
];


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
                backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/025/337/669/small_2x/default-male-avatar-profile-icon-social-media-chatting-online-user-free-vector.jpg')
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