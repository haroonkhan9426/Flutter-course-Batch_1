import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:antonx_museum/core/models/museum.dart';
import 'package:antonx_museum/core/services/custom_database_services.dart';
import 'package:antonx_museum/core/services/firebase_database_services.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final _firebaseDbService = FirebaseDatabaseService();
  final _customDbService = CustomDatabaseServices();
  List<Museum> museums = [];
  List<Exhibition> exhibitions = [];
  bool gotMuseumsData = true;
  bool gotExhibitionsData = true;
  final museum = Museum(title: 'Test', address: 'address', imgUrl: '');

  HomeProvider() {
//    _getData();
  }

//  _getData() async {
////    for (int i = 0; i < 10; i++) {
////      await Future.delayed(Duration(seconds: 2));
////      museums.add(museum);
////      gotMuseumsData = true;
////      notifyListeners();
////    }
////    museums = await _customDbService.getMuseums();
////    gotMuseumsData = true;
////    notifyListeners();
////    exhibitions = await _customDbService.getExhibitions();
////    gotExhibitionsData = true;
////    notifyListeners();
//  }

  addMuseum(museum) {
    museums.add(museum);
    notifyListeners();
  }
}
