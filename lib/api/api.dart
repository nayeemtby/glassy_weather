import 'package:http/http.dart';
import 'key.dart';
import 'dart:convert';
import 'io.dart';

Future<Map<String, dynamic>> getForecast(
  String location,
  bool skipCache,
) async {
  const contentKey = 'forecast.json';
  final String _tmp = await getContent(contentKey);
  final DateTime _now = DateTime.now();

  Map<String, dynamic>? ret;
  Map<String, dynamic>? current;
  Map<String, dynamic> cache = {};

  if (skipCache == false && _tmp.isNotEmpty) {
    cache = jsonDecode(_tmp);
    if (_now
            .difference(DateTime.fromMillisecondsSinceEpoch(cache['cachedAt']))
            .inMinutes <
        5) {
      return cache;
    }
  }

  current = await getCurrent(location, skipCache);

  double lon = current['coord']['lon'];
  double lat = current['coord']['lat'];

  ret = await fetchForecast(lon, lat);

  if (ret != null) {
    ret['cachedAt'] = _now.millisecondsSinceEpoch;
    ret['q'] = location;
    putContent(contentKey, jsonEncode(ret));
    return ret;
  }

  return cache;
}

Future<Map<String, dynamic>> getCurrent(String location, bool skipCache) async {
  const contentKey = 'current.json';
  final String _tmp = await getContent(contentKey);
  final DateTime _now = DateTime.now();

  Map<String, dynamic>? ret = {};
  Map<String, dynamic> cache = {};

  if (skipCache == false && _tmp.isNotEmpty) {
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

Future<Map<String, dynamic>?> fetchCurrent(String location) async {
  Map<String, dynamic> ret = {};

  Response response = await get(
    Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=$newKey',
    ),
  );

  if (response.statusCode != 200) {
    return null;
  }

  ret = jsonDecode(response.body);
  return ret;
}

Future<Map<String, dynamic>?> fetchForecast(double lon, double lat) async {
  Map<String, dynamic> ret = {};

  Response response = await get(
    Uri.parse(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&units=metric&appid=$newKey',
    ),
  );

  if (response.statusCode != 200) {
    return null;
  }

  ret = jsonDecode(response.body);
  return ret;
}
