List<String> _weekDay = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
List<String> _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
String getTime() {
  DateTime now = DateTime.now();
  return '${now.hour}:${now.minute}';
}

String getDay() {
  DateTime today = DateTime.now();
  return '${_weekDay[today.weekday - 1]}, ${_months[today.month - 1]} ${today.day}, ${today.year}';
}
