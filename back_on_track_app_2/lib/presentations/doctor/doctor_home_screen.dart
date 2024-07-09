
import 'package:back_on_track_app_2/presentations/patient/patient_data_screen.dart';
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

  List newsTitle = [
    'Grandes avances en Back On Track','El futuro se ve brillante',
    'Últimas funciones añadidas','Conocé las redes sociales de Back On Track',
  ];

  List news = [
    'En las últimas semanas, el equipo de Back On Track conformado por Julián Vinocur, Mia Payssé, Facundo Maletta, Agustín Guerra y Feliciano Miguez, ha estado realizando avances en varios ámbitos del proyecto. Desde la programación de la aplicación móvil, hasta la construcción del Hardware necesario para realizar las mediciones de la marcha. Sin duda el equipo está trabajando arduamente cada semana para crear el mejor producto posible.',
    '"El futuro se ve brillante..." en las palabras del Project Manager de Back On Track, Feliciano Miguez, el equipo parece estar esperando un gran progreso en las próximas semanas, esperan tener el producto terminado para fines de este año y poder comenzar a utilizarlo en pacientes en rehabilitación realies. Su ilusión se siente en cada avance.',
    'Ahora podes visualizar los datos de tus pacientes de una forma nunca antes vista',
    'No te pierdas el día a día de este proyecto. Seguí a Back On Track en Instagram: @backontrack.meca'
  ];

class Setting{
  String title;
  Icon leading;
  Icon trailing;
  String route;

  Setting({
    required this.title,
    required this.leading,
    required this.trailing,
    required this.route,
  });
}

List <Setting> settings = [
  Setting(title: 'Editar mi perfil',
          leading: const Icon(Icons.edit), 
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          route:'/doctorEditProfile'
          ),
  Setting(title: 'Mis pacientes',
          leading: const Icon(Icons.people), 
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          route:'/doctorViewPatients'
          ),
  Setting(title: 'Ajustes de cuenta',
          leading: const Icon(Icons.settings),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          route:'/doctorAccountSettings'
          ),    
];

// ignore: must_be_immutable
class DoctorHomeScreen extends StatelessWidget {
  static const String name = 'doctorHome';
  final bool doctor;
  const DoctorHomeScreen({super.key, this.doctor = true});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido Dr...'),),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Badge(
                label: Text('4'),
                child: Icon(Icons.home_outlined),
              ),
              label: 'Home'),
          NavigationDestination(
              //selectedIcon: Icon(Icons.list_alt),
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.list),
              ),
              label: 'Pacientes'),
          NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
              ),

        ],
      ),
      body: <Widget>[
        //HOME PAGE
        Column(
          children: [
            const Text('Novedades', style: TextStyle(fontSize: 22, color: Colors.blue)),
            Expanded(
              child: ListView.builder(
                itemCount: newsTitle.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 194, 245, 255),
                    child: ListTile(
                      title: Text(newsTitle[index],
                      style: const TextStyle(fontSize: 20)),
                      subtitle: Text(news[index]),
                      leading: const Icon(Icons.newspaper),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        //PACIENTES
        //appBar: AppBar(title: const Text('Bienvenido Dr...')),
        Column(
          children: [
            const Text('Pacientes'),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 194, 245, 255),
                    child: ListTile(
                      title: Text(patients[index]),
                      subtitle: const Text('ID:'),
                      onTap: (){context.pushNamed(PatientDataScreen.name); },
                      leading: const Icon(Icons.person_outline_outlined),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        //PROFILE
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5.0),
                child: const Icon(
                  Icons.person, 
                  size: 180.0, 
                  color: Colors.blue, 
                ),
              ),
              const Text(
                'Mi Perfil',
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: settings.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 194, 245, 255),
                      child: ListTile(
                        title: Text(settings[index].title,
                        style: const TextStyle(fontSize: 20)),
                        leading: settings[index].leading,
                        trailing: settings[index].trailing,
                        onTap: () {
                          context.push(settings[index].route);
                        },
                      ),
                    );
                  }
                )
              )
            ],
          ),
        )

      ][currentPageIndex],
    );
  }
}
