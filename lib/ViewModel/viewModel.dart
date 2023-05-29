import 'package:flutter/material.dart';

import '../ApiRequest/apiRequest.dart';
import '../ProfileModel/PersonModel.dart';
import '../apiServices/apiService.dart';



class PersonViewModel extends ChangeNotifier {
  PersonModel? _personModel;
  final _repository = PersonRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  PersonModel? get personModel => _personModel;

  Future<void> fetchPersonData() async {
    try {
      _isLoading = true;
      notifyListeners();
      final person = await _repository.GET(
        (jsonData) => PersonModel.fromJson(jsonData),
      );
      _personModel = person;
    
      print('Fetched person: ${person.name}');
    } catch (error) {
      print('Error fetching person: $error');
    
    } finally {
      _isLoading = false;
      notifyListeners(); // move notifyListeners() inside the try-finally block
    }
  }

  
   Future<void> createUser(User user) async {
    try {
      _isLoading = true;
      notifyListeners();
      
      _repository.postData('{constant.BaseUrl}/users', user.toJson(), (jsonData) {
        // Handle the parsed response data
          print(jsonData);
      });
      
      print('User created successfully!');
    
    } catch (error) {
      print('Error creating user: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
