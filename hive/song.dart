import 'package:hive/hive.dart';

// part 'song.g.dart';

@HiveType(typeId: 0)
class Song extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String artist;

  @HiveField(2)
  late String album;

  Song(this.title, this.artist, this.album);
}
