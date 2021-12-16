import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
export 'dart:io' show Directory, File;

final String slash = Platform.pathSeparator;
Future<void> printDirs() async {
  try {
    Directory d = await getApplicationDocumentsDirectory();
    print('AppDocuments Directory: ' + d.path);
  } catch (e) {
    print(e);
  }
  try {
    Directory d = await getApplicationSupportDirectory();
    print('AppSupport Directory: ' + d.path);
  } catch (e) {
    print(e);
  }
  try {
    Directory d = await getDownloadsDirectory() ??
        await getApplicationDocumentsDirectory();
    print('Downloads Directory: ' + d.path);
  } catch (e) {
    print(e);
  }
  try {
    Directory d = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    print('ExternalStorage Directory: ' + d.path);
  } catch (e) {
    print(e);
  }
  try {
    Directory d = await getLibraryDirectory();
    print('Library Directory: ' + d.path);
  } catch (e) {
    print(e);
  }
  try {
    Directory d = await getTemporaryDirectory();
    print('Temporary Directory: ' + d.path);
  } catch (e) {
    print(e);
  }
  try {
    List<Directory> d = await getExternalCacheDirectories() ??
        [await getApplicationDocumentsDirectory()];
    for (var i = 0; i < d.length; i++) {
      print('Cache Directory $i: ' + d[i].path);
    }
  } catch (e) {
    print(e);
  }
}

Future<Directory> getCacheDir() async {
  if (Platform.isWindows) {
    return await getApplicationSupportDirectory();
  }
  return await getApplicationSupportDirectory();
}

Future<File> getCacheFile(String name) async {
  Directory cacheDir = await getCacheDir();
  File file = File(cacheDir.path + slash + name);
  file.createSync();
  return file;
}

Future<String> getContent(String name) async {
  if (kIsWeb) {
    SharedPreferences webIO = await SharedPreferences.getInstance();
    try {
      return webIO.getString(name) ?? '';
    } catch (e) {
      print(e);
    }
  } else {
    File cacheFile = await getCacheFile(name);
    return await cacheFile.readAsString();
  }
  return '';
}

void putContent(String name, String data) async {
  if (kIsWeb) {
    SharedPreferences webIO = await SharedPreferences.getInstance();
    webIO.setString(name, data);
  } else {
    File cacheFile = await getCacheFile(name);
    cacheFile.writeAsString(data, flush: true);
  }
}
