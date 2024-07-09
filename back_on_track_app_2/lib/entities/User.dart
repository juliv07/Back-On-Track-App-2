class User {
  String name;
  String surname;
  String email;
  int phone;
  String password;

  bool isDoctor;

  //Patients:
  String? asignedDoctor;
  int? birthYear;
  double? height;
  double? weight;
  String? previousInfo;

  //Doctors:
  List<String>? asignedPatients; //Signo de pregunta hace que pueda ser null
  String? healthCenter;

  User({
    required this.isDoctor,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.phone,
    this.asignedDoctor,
    this.birthYear,
    this.height,
    this.weight,
    this.previousInfo,
    this.asignedPatients,
    this.healthCenter,
  });
}