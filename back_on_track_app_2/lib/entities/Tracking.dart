class Tracking{
  String patient;
  
  int year;
  int month;
  int date;
  int hour;
  int minute;
  int second;
  int millisecond;

  int yaw1;
  int yaw2;
  int pitch1;
  int pithc2;
  int roll1;
  int roll2;

  int kneeAngle1;
  int kneeAngle2;

  Tracking({
    required this.patient,
    required this.year,
    required this.month,
    required this.date,
    required this.hour,
    required this.minute,
    required this.second,
    required this.millisecond,
    required this.yaw1,
    required this.yaw2,
    required this.pitch1,
    required this.pithc2,
    required this.roll1,
    required this.roll2,
    required this.kneeAngle1,
    required this.kneeAngle2,
  });
}