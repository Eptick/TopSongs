import 'package:flutter/material.dart';
import 'package:flutter_app/models/song-list.dart';
import 'package:provider/provider.dart';

class SongListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SongListModel>(builder: (context, songList, child) {
      return  Container(
        height: 40,
        width: 20,
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: songList.songs.length,
          itemBuilder: (context, index) => Container(
            child: Text(
              songList.songs[index].title,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Montserrat",
                color: Colors.black,
              ),
            ),
          ))
      );
    });
  }
}
