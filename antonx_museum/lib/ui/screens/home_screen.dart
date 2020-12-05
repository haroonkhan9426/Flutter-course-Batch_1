import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:antonx_museum/core/models/museum.dart';
import 'package:antonx_museum/core/services/auth_service.dart';
import 'package:antonx_museum/core/services/database_services.dart';
import 'package:antonx_museum/ui/custom_widgets/exhibition_tile.dart';
import 'package:antonx_museum/ui/custom_widgets/museum_tile.dart';
import 'package:antonx_museum/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/museum_tile.dart';
import 'add_museum_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _dbService = DatabaseService();
  List<Museum> museums = [];
  List<Exhibition> exhibitions = [];
  bool gotMuseumData = false;
  bool gotExhibitionData = false;
  Map<String, dynamic> json = {
    "name": "Haroon Khan",
    "class": "O-level",
    "address": {
      "house_no": "20",
      "street": "Sheikh street",
      "city": "Peshawar",
      "test": {
        "test_nested": "this is test",
      },
    },
    "scores": [
      {"Subject": "math", "marks": "20"},
      {"Subject": "english", "marks": "30"}
    ]
  };

  String name;
  String house;
  String test;

  @override
  void initState() {
    name = json['name'];
    house = json['address']['house_no'];
    test = json['address']['test']['test_nested'];
    print('Name: $name');
    print('House#: $house');
    print('test: $test');
    _getData();
    super.initState();
  }

  _getData() async {
    museums = await _dbService.getMuseums();
    gotMuseumData = true;
    setState(() {});

    exhibitions = await _dbService.getExhibitions();
    gotExhibitionData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddMuseumScreen()));
          },
        ),
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

                  RaisedButton(
                    child: Text('Logout'),
                    onPressed: () async {
                      await AuthService().logout();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                    },
                  ),

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
                  !gotMuseumData
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: 200,

                          /// Default ListView
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children:
                                museums.map((m) => MuseumTile(m)).toList(),
                          ),
                        ),

                  SizedBox(height: 40),

                  /// Vertical list view of news & exhibitions
                  !gotExhibitionData
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
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
