import 'package:flutter/material.dart';

class SongListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
      child: Row(
        children: [
          Container(
            margin:  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Text("1", style: TextStyle(fontSize: 20, color: Colors.grey),),
          ),
          Container(
            child: Image.network('https://placehold.it/60x60', width: 60, height: 60,),
          ),
          Container(
            child: Column(
              children: [
                Text("Naslov gore", style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: "Montserrat")),
                Text("Kid cudi", style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: "Montserrat")),
              ]
            ),
          ),
        ],
      )
    );
  }
}