import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List patients = [
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
    'Sandra Casandra',
  ];

class DoctorViewPatientsScreen extends StatelessWidget {
  const DoctorViewPatientsScreen({super.key});
  static const String name = 'doctorViewPatients';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis pacientes')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 194, 245, 255),
                      child: ListTile(
                        title: Text(patients[index],
                        style: const TextStyle(fontSize: 20)),
                        leading: const Icon(Icons.person_outline),
                        trailing: const Icon(Icons.menu),
                      ),
                    );
                  },
                ),
              ),
              FloatingActionButton(onPressed: (){
                context.push('doctorFindNewPatients');
              },
              child: const Icon(Icons.add),
              )
            ],
          )
        )
      )
    );
  }
}