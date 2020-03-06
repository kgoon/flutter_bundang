import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';

class DatabaseService {
  DatabaseService._internal();

  factory DatabaseService.fromSingleton() {
    return _instance;
  }

  static final DatabaseService _instance = DatabaseService._internal();

  Future checkUserName({
    @required String name,
  }) async {
    assert(name != null);
    try {
      final databaseResult = http.get(
          'https://flutter-study-api.appspot.com/api/user/profile/name/exist?userName=$name');
      return databaseResult;
    } catch (e) {
      rethrow;
    }
  }

  Future setUserName({
    @required String token,
    @required String name,
  }) async {
    assert(token != null);
    assert(name != null);
    try {
      Map<String, String> headerData = {
        'Authorization': token,
      };
      Map bodyData = {
        'userName': name,
      };
      final databaseResult = await http.put(
        'https://flutter-study-api.appspot.com/api/user/profile/name',
        headers: headerData,
        body: bodyData,
      );
      return databaseResult;
    } catch (e) {
      rethrow;
    }
  }

  Future setProfileImage({
    @required String token,
    @required String filePath,
    @required File image,
  }) async {
    assert(token != null);
    assert(filePath != null);
    assert(image != null);
    try {
      var uri =
          Uri.parse('https://flutter-study-api.appspot.com/api/file/avatar');
      var stream = http.ByteStream(DelegatingStream.typed((image.openRead())));
      var length = await image.length();
      var fileName = basename(filePath);
      var fileType = basename(filePath).split('.').last;
      Map<String, String> headerData = {
        'Authorization': token,
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headerData)
        ..files.add(
          http.MultipartFile(
            'file',
            stream,
            length,
            filename: fileName,
            contentType: MediaType('image', fileType),
          ),
        );
      var response = request.send();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
