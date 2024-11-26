import 'package:back_on_track_app_2/entities/News.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<List<News>> newsProvider = StateProvider((ref) => [
  News(
    title: 'Back On Track en Expo Mecatrónica', 
    text: 'Llegó el día tan esperado... El 20 y 21 de noviembre, el equipo de Back On Track conformado por Julián Vinocur, Mia Payssé, Facundo Maletta, Agustín Guerra y Feliciano Miguez mostraron un prototipo de Back On Track en la Expo Mecatrónica, un evento en el que se muestran decenas de proyectos realizados en la escuela ante otros estudiantes, profesores y directivos.',
    image: 'assets/expomeca.jpg'
  ),
  News(
    title: 'Últimas funciones añadidas', 
    text: 'Ahora podes visualizar los datos de tus pacientes de una forma nunca antes vista.',
    image: 'assets/grafico.jpg'
  )

]);

StateProvider<int> selectedNewsProvider = StateProvider((ref) => 0);