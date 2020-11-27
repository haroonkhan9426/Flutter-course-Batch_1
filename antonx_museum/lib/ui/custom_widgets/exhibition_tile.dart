import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:flutter/material.dart';

class ExhibitionTile extends StatelessWidget {
  final Exhibition exhibition;

  ExhibitionTile(this.exhibition);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          Container(
            width: 100,
            height: 150,
            color: Colors.lightGreen,
          ),

          /// Column of text widgets
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exhibition.date,
                    style: TextStyle(fontSize: 15, color: Colors.green),
                  ),
                  SizedBox(height: 5),
                  Text(
                    exhibition.title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.pin_drop, color: Colors.grey),
                      Text(
                        exhibition.address,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),

          /// Bookmark icons
          Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 40,
            height: 40,
            child: Icon(Icons.bookmark_border),
          )
        ],
      ),
    );
  }
}
