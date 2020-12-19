import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:antonx_museum/core/models/museum.dart';
import 'package:antonx_museum/core/services/auth_service.dart';
import 'package:antonx_museum/core/services/custom_database_services.dart';
import 'package:antonx_museum/core/services/firebase_database_services.dart';
import 'package:antonx_museum/ui/custom_widgets/exhibition_tile.dart';
import 'package:antonx_museum/ui/custom_widgets/museum_tile.dart';
import 'package:antonx_museum/ui/screens/home/home_provider.dart';
import 'package:antonx_museum/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/museum_tile.dart';
import '../add_museum_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Scaffold(
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
                    !provider.gotMuseumsData
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
                              children: provider.museums
                                  .map((m) => MuseumTile(m))
                                  .toList(),
                            ),
                          ),

                    SizedBox(height: 40),

                    /// Vertical list view of news & exhibitions
                    !provider.gotExhibitionsData
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: provider.exhibitions.length,
                            itemBuilder: (context, index) =>
                                ExhibitionTile(provider.exhibitions[index])),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
