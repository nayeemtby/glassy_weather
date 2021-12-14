import 'package:http/http.dart';
import 'key.dart';
import 'dart:convert';
import 'cache/current.dart';

Future<Map> getCurrent(String location) async {
  Map ret = {};
  Response response = await get(Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no'));
  if (response.statusCode != 200) {
    return cache;
  }
  ret = jsonDecode(response.body);
  return ret;
}

Future<Map> getForecast(String location, String days) async {
  Map ret = {};
  Response response = await get(Uri.parse(
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&aqi=no'));
  if (response.statusCode != 200) {
    return cache;
  }
  ret = jsonDecode(response.body);
  return ret;
}
