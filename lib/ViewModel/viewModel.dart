import 'package:flutter/material.dart';

import '../ApiRequest/apiRequest.dart';
import '../ProfileModel/PersonModel.dart';
import '../apiServices/apiService.dart';

// class PersonViewModel extends ChangeNotifier {
//   PersonModel? _personModel;
//   final _repository = PersonRepository();

//   PersonModel? get personModel => _personModel;

//   Future<void> fetchPerson() async {
//     try {
//       final person = await _repository.fetchPerson();
//       _personModel = person;
//       notifyListeners();
//     } catch (error) {
//       print('Error fetching person: $error');
//     }
//   }
// }

// class PersonViewModel extends ChangeNotifier {
//   PersonModel? _personModel;
//   final _repository = PersonRepository();

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//   notifyListeners();
//   PersonModel? get personModel => _personModel;

//   Future<void> fetchPerson() async {
//     try {
//       _isLoading = true; // Set isLoading to true while the data is being fetched
//       notifyListeners();

//       final person = await _repository.fetchPerson();
//       _personModel = person;
//       notifyListeners();
//     } catch (error) {
//       print('Error fetching person: $error');
//     } finally {
//       _isLoading = false; // Set isLoading to false once the data is fetched
//       notifyListeners();
//     }
//   }

// }

class PersonViewModel extends ChangeNotifier {
  PersonModel? _personModel;
  final _repository = PersonRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  PersonModel? get personModel => _personModel;

  Future<void> fetchPerson() async {
    try {
      _isLoading = true;
      notifyListeners();

      final person = await _repository.fetchPerson();
      _personModel = person;
    } catch (error) {
      print('Error fetching person: $error');
    } finally {
      _isLoading = false;
      notifyListeners(); // move notifyListeners() inside the try-finally block
    }
  }
}

class UserViewModel extends ChangeNotifier {
  final _repository = UserRepository();

  Future<void> createUser(String name, String email) async {
    // final user = User(name: name, email: email);
    final user = User(name: name, email: email);

    try {
      await _repository.createUser(user);
      print('User created successfully!');
    } catch (error) {
      print('Error creating user: $error');
    }
  }
}
