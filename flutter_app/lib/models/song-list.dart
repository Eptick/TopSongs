import 'package:flutter/foundation.dart';
import './song.dart';

class SongListModel extends ChangeNotifier {
  final List<Song> _songs = [];

  List<Song> get songs => _songs.toList();

  void add(Song song) {
    _songs.add(song);
    notifyListeners();
  }

  void remove(int songId) {
    _songs.removeWhere((element) => element.id == songId);
    notifyListeners();
  }

}