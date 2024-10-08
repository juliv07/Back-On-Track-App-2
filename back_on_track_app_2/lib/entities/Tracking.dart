class Tracking{
  String patientId;
  
  int year;
  int month;
  int date;
  int hour;
  int minute;
  int second;
  int millisecond;

  int? z1; //roll
  int? z2;
  int? y1; //pitch
  int? y2;
  int? x1; //yaw
  int? x2;

  int? kneeAngle1;
  int? kneeAngle2;

  Tracking({
    required this.patientId,
    required this.year,
    required this.month,
    required this.date,
    required this.hour,
    required this.minute,
    required this.second,
    required this.millisecond,
    this.x1,
    this.y1,
    this.z1,
    this.x2,
    this.y2,
    this.z2,
    this.kneeAngle1,
    this.kneeAngle2,
  });
}