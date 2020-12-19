import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:antonx_museum/core/models/museum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class CustomDatabaseServices {
  Dio dio = Dio();
  String baseUrl = 'https://5fd34c758cee610016ae0321.mockapi.io/api/antonx/v1';

  Future<List<Museum>> getMuseums() async {
    String endPoint = '/museums';
    final List<Museum> museums = [];
    final Response response = await dio.get('$baseUrl$endPoint');
    print('Backend response: ${response.data}');
    if (response.statusCode == 200) {
      final List jsonArray = response.data;
      jsonArray.forEach((doc) {
        museums.add(Museum.fromJson(doc));
      });
    }
    return museums;
  }

  Future<List<Exhibition>> getExhibitions() async {
    final List<Exhibition> exhibitions = [];
    final endPoint = '/exhibitions';
    final response = await dio.get('$baseUrl$endPoint');
    if (response.statusCode == 200) {
      print('Docs returned from custom backend: ${response.data}');
      final List jsonArray = response.data;
      jsonArray.forEach((doc) {
        exhibitions.add(Exhibition.fromJson(doc));
      });
    }
    return exhibitions;
  }

  Future<void> addMuseum(Museum museum) async {
    String endPoint = '/museums';
    await dio.post('$baseUrl$endPoint', data: museum.toJson());
  }
}
