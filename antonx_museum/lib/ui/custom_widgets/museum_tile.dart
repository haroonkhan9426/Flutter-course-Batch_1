import 'package:flutter/material.dart';

class MuseumTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 170,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ///Image section
          Container(
            height: 90,
            color: Colors.yellow,
          ),

          /// Row of Name text and bookmark
          Row(
            children: [
              Flexible(child: Text('Peshawar Museum Peshawar city')),
              SizedBox(width: 5),
              Icon(Icons.bookmark_border),
            ],
          ),

          /// Row of Pin icon and address text
          Row(
            children: [
              Icon(Icons.pin_drop),
              SizedBox(width: 5),
              Flexible(child: Text('Jail road Peshawar')),
            ],
          )
        ],
      ),
    );
  }
}
