class Tracking{
  String patientId;
  
  int year;
  int month;
  int date;
  int hour;
  int minute;
  int second;
  int millisecond;

  int? yaw1;
  int? yaw2;
  int? pitch1;
  int? pithc2;
  int? roll1;
  int? roll2;

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
    this.yaw1,
    this.yaw2,
    this.pitch1,
    this.pithc2,
    this.roll1,
    this.roll2,
    this.kneeAngle1,
    this.kneeAngle2,
  });
}