import 'package:flutter/material.dart';
import 'package:netflix_app/models/serachmovies_models.dart';
import 'package:netflix_app/services/api_services.dart';

class SearchpageProvider with ChangeNotifier {
  SerachmoviesModels? searchModel;
  final ApiServices apiServices = ApiServices();

  void search(String query) {
    if (query.isNotEmpty) {
      apiServices.getsearchMovies(query).then((results) {
        searchModel = results;
        notifyListeners(); // Notify listeners after fetching data
      }).catchError((error) {
        print("Error fetching search results: $error");
        searchModel = null; // Set to null in case of error
        notifyListeners(); // Notify listeners about the error
      });
    } else {
      searchModel = null; // Reset if query is empty
      notifyListeners();
    }
  }
}
