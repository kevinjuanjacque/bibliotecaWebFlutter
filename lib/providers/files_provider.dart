import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_flutter/model/files.dart';

class FilesProvider {
  String _url = 'biblioteca-web-icci.herokuapp.com';

  Future<List<File>> getFile() async {
    final uri = Uri.https(_url, 'file');
    final resp = await http.get(uri);
    final respDecode = json.decode(resp.body);
    final files = new Files.fromJsonList(respDecode);
    return files.items;
  }
}
