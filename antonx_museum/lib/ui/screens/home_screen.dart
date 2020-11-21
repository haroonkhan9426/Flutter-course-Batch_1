import 'package:antonx_museum/ui/custom_widgets/museum_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        MuseumTile(),
                        MuseumTile(),
                        MuseumTile(),
                      ],
                    ),
                  ),

                  /// Vertical list view of news & exhibitions
                ],
              ),
            ),
          ),
        ));
  }
}
