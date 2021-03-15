class Song {
  final int id;
  final String title;
  final String artist;
  final int duration;
  final String thumbnail;

  Song(
    this.id,
    this.title,
    this.artist,
    this.duration,
    this.thumbnail
  );
  
  @override
  int get hashCode => id;

}