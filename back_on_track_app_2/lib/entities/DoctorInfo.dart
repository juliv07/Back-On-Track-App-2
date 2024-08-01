import 'package:cloud_firestore/cloud_firestore.dart';

// Tu clase DoctorInfo
class DoctorInfo {
  String name;
  String surname;
  String email;
  int phone;
  String password;
  List<String>? asignedPatients;
  String? healthCenter;

  DoctorInfo({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.password,
    required this.asignedPatients,
    required this.healthCenter,
  });

  // Constructor para crear una instancia de DoctorInfo desde un Map
  factory DoctorInfo.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return DoctorInfo(
      name: data['name'] ?? '',
      surname: data['surname'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? 0,
      password: data['password'] ?? '',
      asignedPatients: (data['asignedPatients'] as List<dynamic>?)?.map((e) => e as String).toList(),
      healthCenter: data['healthCenter'],
    );
  }
}

Future<DoctorInfo?> getDoctorInfo(String userId) async {
  try {
    final docRef = FirebaseFirestore.instance.collection('users').doc(userId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // Crear instancia de DoctorInfo desde el documento de Firestore
      return DoctorInfo.fromFirestore(docSnapshot);
    } else {
      // Manejar el caso en que el documento no existe
      print('No se encontró el usuario');
      return null;
    }
  } catch (e) {
    print('Error al obtener datos del usuario: $e');
    return null;
  }
}
