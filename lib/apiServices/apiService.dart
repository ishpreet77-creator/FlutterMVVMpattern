import 'dart:async';
import 'dart:convert';
import 'package:flutter_mvvm_pattern/Constant/constant.dart';
import 'package:http/http.dart' as http;

import '../ApiRequest/apiRequest.dart';
import '../ProfileModel/PersonModel.dart';
import 'package:flutter_mvvm_pattern/ProfileModel/PersonModel.dart';



class PersonRepository {
 Future<T> GET<T>(T Function(dynamic) parser) async {
    try {
      final response = await http.get(Uri.parse(constant.BaseUrl));

      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
        final jsonData = json.decode(response.body);
        return parser(jsonData);
      } else {
        throw Exception('Failed to fetch data');
      }
    } on Exception catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }

  

   Future<T> postData<T>(String apiUrl, dynamic data, T Function(dynamic) parser) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        return parser(jsonData);
      } else {
        throw Exception('Failed to create data');
      }
    } on Exception catch (error) {
      throw Exception('Failed to create data: $error');
    }
  }
}
