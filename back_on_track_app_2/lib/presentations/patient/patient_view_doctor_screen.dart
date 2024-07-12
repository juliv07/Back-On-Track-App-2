import 'package:flutter/material.dart';

class ProfileSetting{
    String title;
    String subtitle;
    Icon leading;

    ProfileSetting({
      required this.title,
      required this.subtitle,
      required this.leading,
    });
  }

List <ProfileSetting> profileSettings = [
  ProfileSetting(title: 'Nombre', subtitle: 'Dr. Nefario', leading: const Icon(Icons.badge)),
  ProfileSetting(title: 'Institución', subtitle: 'Hospital Italiano', leading: const Icon(Icons.local_hospital)),
];

class PatientViewDoctorScreen extends StatelessWidget {
  const PatientViewDoctorScreen({super.key});
  static const String name = 'patientViewDoctor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi doctor')),
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
                        leading: profileSettings[index].leading,
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