import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DocumentsRepo {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/workouts.json');
  }

  Future<File> writeJson(String jsonString) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(jsonString, mode: FileMode.append);
  }

  // read from local documents directory
  Future<String> readJson() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "";
    }
  }
}
