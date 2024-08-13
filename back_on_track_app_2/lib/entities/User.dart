class User {
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
}