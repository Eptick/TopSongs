import 'package:flutter/material.dart';

class SongListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
      child: Row(
        children: [
          Container(
            margin:  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all( color: Colors.grey, width: 1)
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "1",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700
                  )
                )
              ),
            ),
          ),
          Container(
            child: Image.network('https://placehold.it/60x60', width: 60, height: 60,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Naslov gore",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: "Montserrat"
                  )
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kid cudi",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontFamily: "Montserrat"
                  )
                ),
              )
            ]
          ),
        ],
      )
    );
  }
}