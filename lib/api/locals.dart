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
String getFormattedTime(DateTime time) {
  return '${time.hour}:${time.minute < 10 ? '0' + time.minute.toString() : time.minute}';
}

String getFormattedDay(DateTime today) {
  return '${_weekDay[today.weekday - 1]}, ${_months[today.month - 1]} ${today.day}, ${today.year}';
}
