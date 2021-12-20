import 'package:http/http.dart';
import 'key.dart';
import 'dart:convert';
import 'io.dart';

Future<Map> getForecast(String location) async {
  const contentKey = 'forecast.json';
  final String _tmp = await getContent(contentKey);
  final DateTime _now = DateTime.now();

  Map? ret = {};
  Map cache = {};

  if (_tmp.isNotEmpty) {
    cache = jsonDecode(_tmp);
    if (_now
            .difference(DateTime.fromMillisecondsSinceEpoch(cache['cachedAt']))
            .inMinutes <
        5) {
      return cache;
    }
  }

  ret = await fetchForecast(location);
  if (ret != null) {
    ret['cachedAt'] = _now.millisecondsSinceEpoch;
    putContent(contentKey, jsonEncode(ret));
    return ret;
  }
  return cache;
}

Future<Map> getCurrent(String location) async {
  const contentKey = 'current.json';
  final String _tmp = await getContent(contentKey);
  final DateTime _now = DateTime.now();

  Map? ret = {};
  Map cache = {};

  if (_tmp.isNotEmpty) {
    cache = jsonDecode(_tmp);
    if (_now
            .difference(DateTime.fromMillisecondsSinceEpoch(cache['cachedAt']))
            .inMinutes <
        5) {
      return cache;
    }
  }

  ret = await fetchCurrent(location);
  if (ret != null) {
    ret['cachedAt'] = _now.millisecondsSinceEpoch;
    putContent(contentKey, jsonEncode(ret));
    return ret;
  }
  return cache;
}

Future<Map?> fetchCurrent(String location) async {
  Map ret = {};
  Response response = await get(Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no'));
  if (response.statusCode != 200) {
    return null;
  }
  ret = jsonDecode(response.body);
  return ret;
}

Future<Map?> fetchForecast(String location) async {
  Map ret = {};
  Response response = await get(Uri.parse(
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&aqi=no&days=7'));
  if (response.statusCode != 200) {
    return null;
  }
  ret = jsonDecode(response.body);
  return ret;
}
