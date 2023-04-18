import 'dart:async';
import 'dart:convert';
import 'package:flutter_mvvm_pattern/Constant/constant.dart';
import 'package:http/http.dart' as http;

import '../ApiRequest/apiRequest.dart';
import '../ProfileModel/PersonModel.dart';
import 'package:flutter_mvvm_pattern/ProfileModel/PersonModel.dart';

// class PersonRepository {
//   Future<PersonModel> fetchPerson() async {
//     final response = await http.get(Uri.parse('${constant.BaseUrl}/persion'));
//     if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
//       final jsonData = json.decode(response.body);
//       return PersonModel.fromJson(jsonData);
//     } else {
//       throw Exception('Failed to fetch person');
//     }
//   }
// }

class PersonRepository {
  Future<PersonModel> fetchPerson() async {
    try {
      final response = await http.get(Uri.parse('${constant.BaseUrl}') // set the timeout to 10 seconds
          );

      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
        final jsonData = json.decode(response.body);
        return PersonModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch person');
      }
    } on TimeoutException catch (error) {
      throw Exception('Request timed out: $error');
    } catch (error) {
      throw Exception('Failed to fetch person: $error');
    }
  }
}

// class UserRepository {
//   Future<void> createUser(User user) async {
//     final response = await http.post(
//       Uri.parse('${constant.BaseUrl}/users'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(user.toJson()),
//     );
//     if (response.statusCode == 201) {
//       print("data:--   ${response.body}");
//       print('User created successfully!');
//     } else {
//       throw Exception('Failed to create user');
//     }
//   }
// }

class UserRepository {
  Future<void> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('${constant.BaseUrl}/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
        // timeout: const Duration(seconds: 10),
      );
      if (response.statusCode == 201) {
        print("data:--   ${response.body}");
        print('User created successfully!');
      } else {
        throw Exception('Failed to create user');
      }
    } catch (error) {
      print('Error creating user: $error');
      throw Exception('Failed to create user: $error');
    }
  }
}
