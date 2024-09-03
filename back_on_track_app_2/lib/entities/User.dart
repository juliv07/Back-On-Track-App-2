import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String name;
  String surname;
  String email;
  String phone;
  String password;

  bool isDoctor;

  //Patients:
  String? assignedDoctor;
  int? birthYear;
  double? height;
  double? weight;
  String? previousInfo;

  //Doctors:
  List<String>? assignedPatients; //Signo de pregunta hace que pueda ser null
  String? healthCenter;

  User({
    required this.userId,
    required this.isDoctor,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.phone,
    this.assignedDoctor,
    this.birthYear,
    this.height,
    this.weight,
    this.previousInfo,
    this.assignedPatients,
    this.healthCenter,
  });

  factory User.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
    ){
      final data = snapshot.data();
      return User(
        userId: data?['userId'], 
        isDoctor: data?['isDoctor'], 
        name: data?['name'], 
        surname: data?['surname'], 
        email: data?['email'], 
        password: data?['password'], 
        phone: data?['phone']
      );
    }
  
    Map<String, dynamic> toFirestore(){
      return{
        "userId": userId,
        "isDoctor": isDoctor,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "phone": phone,
      
      };
    }
}