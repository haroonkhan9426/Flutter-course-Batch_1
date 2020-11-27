import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:antonx_museum/core/models/museum.dart';
import 'package:antonx_museum/core/services/database_services.dart';
import 'package:antonx_museum/ui/custom_widgets/exhibition_tile.dart';
import 'package:antonx_museum/ui/custom_widgets/museum_tile.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/museum_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _dbService = DatabaseService();
  List<Museum> museums = [];
  List<Exhibition> exhibitions = [];

  @override
  void initState() {
    museums = _dbService.getMuseums();
    exhibitions = _dbService.getExhibitions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                children: [
                  /// Header
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Icon(Icons.pin_drop),
                        Text('Peshawar'),
                        Icon(Icons.keyboard_arrow_down),
                        Spacer(),
                        Icon(Icons.map),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  /// Search TextField
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  /// Horizontal list view of visited
                  Container(
                    height: 200,

                    /// Default ListView
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: museums.map((m) => MuseumTile(m)).toList(),
                    ),
                  ),

                  SizedBox(height: 40),

                  /// Vertical list view of news & exhibitions
                  ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: exhibitions.length,
                      itemBuilder: (context, index) =>
                          ExhibitionTile(exhibitions[index])),
                ],
              ),
            ),
          ),
        ));
  }
}
