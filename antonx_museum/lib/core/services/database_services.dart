import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:antonx_museum/core/models/museum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _fireStoreRef = FirebaseFirestore.instance;

  Future<List<Museum>> getMuseums() async {
    final List<Museum> museums = [];
    final snapshot = await _fireStoreRef.collection('museums').get();
    if (snapshot.size > 0) {
      print('Docs returned from Database: ${snapshot.docs.length}');
//      for (int i = 0; i < snapshot.docs.length; i++) {
//        museums.add(Museum.fromJson(snapshot.docs[i]));
//      }
      snapshot.docs.forEach((doc) {
        museums.add(Museum.fromJson(doc));
      });
    }
    return museums;
  }

  Future<List<Exhibition>> getExhibitions() async {
    final List<Exhibition> exhibitions = [];
    final snapshot = await _fireStoreRef.collection('exhibitions').get();
    if (snapshot.size > 0) {
      print('Docs returned from Database: ${snapshot.docs.length}');
      snapshot.docs.forEach((doc) {
        exhibitions.add(Exhibition.fromJson(doc));
      });
    }
    return exhibitions;
  }

  addMuseum(Museum museum) {
    _fireStoreRef.collection('museums').add(museum.toJson());
  }
}
