
import 'package:back_on_track_app_2/entities/News.dart';
import 'package:back_on_track_app_2/entities/User.dart';
import 'package:back_on_track_app_2/presentations/doctor/doctor_search_patient_screen.dart';
import 'package:back_on_track_app_2/presentations/doctor/patient_data_screen.dart';
import 'package:back_on_track_app_2/providers/news_provider.dart';
import 'package:back_on_track_app_2/providers/patients_provider.dart';
import 'package:back_on_track_app_2/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

  /*List newsTitle = [
    'Grandes avances en Back On Track','El futuro se ve brillante',
    'Últimas funciones añadidas','Conocé las redes sociales de Back On Track',
  ];

  List news = [
    'En las últimas semanas, el equipo de Back On Track conformado por Julián Vinocur, Mia Payssé, Facundo Maletta, Agustín Guerra y Feliciano Miguez, ha estado realizando avances en varios ámbitos del proyecto. Desde la programación de la aplicación móvil, hasta la construcción del Hardware necesario para realizar las mediciones de la marcha. Sin duda el equipo está trabajando arduamente cada semana para crear el mejor producto posible.',
    '"El futuro se ve brillante..." en las palabras del Project Manager de Back On Track, Feliciano Miguez, el equipo parece estar esperando un gran progreso en las próximas semanas, esperan tener el producto terminado para fines de este año y poder comenzar a utilizarlo en pacientes en rehabilitación realies. Su ilusión se siente en cada avance.',
    'Ahora podes visualizar los datos de tus pacientes de una forma nunca antes vista',
    'No te pierdas el día a día de este proyecto. Seguí a Back On Track en Instagram: @backontrack.meca'
  ];*/

class Setting{
  String title;
  Icon leading;
  Icon trailing;
  String? route;
  SnackBar? snackbar;

  Setting({
    required this.title,
    required this.leading,
    required this.trailing,
    this.route,
    this.snackbar,
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
          snackbar: SnackBar(
          content: const Text.rich(
            TextSpan(
              text: 'Esta función todavía no está disponible.\n',
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,), 
              children: <TextSpan>[
                TextSpan(
                  text: 'Seguimos mejorando Back On Track, próximamente vas a poder administrar tus pacientes. Puedes ir a la pantalla de Pacientes para verlos. Mantente atento a las novedades.',
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
  Setting(title: 'Ajustes de cuenta',
          leading: const Icon(Icons.settings),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          route:'/doctorAccountSettings'
          ),    
];

// ignore: must_be_immutable
class DoctorHomeScreen extends ConsumerStatefulWidget {

  static const String name = 'doctorHome';
  final bool doctor;
  const DoctorHomeScreen({super.key, this.doctor = true});

  @override
  ConsumerState<DoctorHomeScreen> createState() => DoctorHomeScreenState();
}

class DoctorHomeScreenState extends ConsumerState<DoctorHomeScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    currentPageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    User userInfo = ref.watch(userInfoProvider);

    List<User> patientsInfo = ref.watch(patientsProvider);

    List<News> newsList = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido, Dr. ${userInfo.surname}'),),
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
              icon: //Badge(
                //label: Text('4'),
                //child: 
                Icon(Icons.home_outlined),
              //),
              label: 'Home'),
          NavigationDestination(
              //selectedIcon: Icon(Icons.list_alt),
              icon: //Badge(
                //label: Text('2'),
                //child: 
                Icon(Icons.list),
              //),
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
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 194, 245, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(newsList[index].image != null)
                              Image.asset(
                                newsList[index].image!,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ListTile(
                                title: Text(
                                  newsList[index].title,
                                  style: const TextStyle(fontSize: 20, ),
                                  
                                ),
                                subtitle: Text(newsList[index].text),
                                //leading: const Icon(Icons.newspaper),
                                
                              ),
                          ],
                        ),
                    )                
                  );
                },
              ),
            ),
          ],
        ),

        //PACIENTES

        Column(
          children: [
            const Text('Pacientes'),

            ElevatedButton(
              onPressed: (){
                ref.read(patientsProvider.notifier).getAssignedPatientsData();
                
                print('PACIENTEESSS:$patientsInfo');
                
              },
              child: const Text('Mostrar pacientes')),

            Expanded(
              child: ListView.builder(
                itemCount: patientsInfo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(patientsInfo[index].surname),
                    subtitle: Text(patientsInfo[index].name),
                    onTap: (){
                      ref.read(selectedPatientProvider.notifier).state = patientsInfo[index].userId;
                      context.pushNamed(PatientDataScreen.name);
                    },
                    leading: const Icon(Icons.person_outline_outlined),
                  );
                },
              ),
            
            ),
            /*Expanded(
              child: Visibility(
                visible: userInfo.assignedPatients?[0]=='No disponible',
                child: const Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text("Usted todavía no tiene pacientes. Agregue uno con el botón '+'.", textAlign: TextAlign.center,),
                )
              )
            ),*/
            FloatingActionButton(
              onPressed: (){
                print('yendoooo');
                context.pushNamed(DoctorSearchPatientScreen.name);
                
              },
              child: const Text('+'),
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
                           if(settings[index].route != null){
                          context.push(settings[index].route.toString());
                        } else{
                          ScaffoldMessenger.of(context).showSnackBar(settings[index].snackbar!);
                        }
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