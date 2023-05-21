import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofitapi_flutter/base/base_viewmodel.dart';
import 'package:retrofitapi_flutter/components/item_albumb.dart';
import 'package:retrofitapi_flutter/models/albumb_model.dart';
import '../components/item_music.dart';
import '../gen/assets.gen.dart';
import '../models/food_model.dart';
import '../remote/service/response/news_response.dart';
import 'audio/audio_provider_viewmodel.dart';

class HomeVM extends BaseViewModel {
  NewAllResponse? data;
  List<FoodModel> listData = [];
  List<AlbumModel> listDataAlbum = [];

  List<Widget> listViewAlbum = [];
  List<Widget> listViewMusic = [];

  late PersistentBottomSheetController sheetController;

  // This variable will hold a reference to the scaffold context.
  late BuildContext _scaffoldCtx;

  bool _showSheet = false;

  bool get showSheet => _showSheet;

  @override
  void onInit() {
    print("HomeVM");
    fetchNewsAll();
    fetchAlbumAll();
    fetchMusicAll();
    fetchDataAlbumAll();
    // saveSongsToHive();
  }

  Future fetchNewsAll() async {
    showLoading();
    try {
      final response = await api.newServices.getNewAll();
      data = response;
      listData.addAll(data?.dataList ?? []);
      notifyListeners();
      hideLoading();
    } on DioError catch (e) {
      print(e);
      hideLoading();
    }
  }
  // Future<void> saveSongsToHive() async {
  //   final appDocumentDir = await getApplicationDocumentsDirectory();
  //   Hive.init(appDocumentDir.path);
  //
  //   // Open the Hive box
  //   final box = await HiveBox.openBox();
  //
  //   // Lấy danh sách bài hát từ thiết bị
  //   final List<Song> songs = await getDeviceSongs();
  //
  //   // Lưu danh sách bài hát vào Hive box
  //   box.clear();
  //   box.addAll(songs);
  //
  //   // Đóng Hive box
  //   await box.close();
  // }
  //
  // Future<List<Song>> getDeviceSongs() async {
  //   final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  //   final List<Song> songs = (await audioQuery.getSongs()).cast<Song>();
  //
  //   List<Song> songList = [];
  //   for (final songInfo in songs) {
  //     final String title = songInfo.title ?? '';
  //     final String artist = songInfo.artist ?? '';
  //     final String album = songInfo.album ?? '';
  //     final Song song = Song(title, artist, album);
  //     songList.add(song);
  //   }
  //
  //   return songList;
  // }

  Future fetchDataAlbumAll() async {
    listDataAlbum.add(AlbumModel(
        id: 0,
        title: 'HIP HOP',
        description: 'MUSIC',
        imageUrl: 'assets/images/unsplash_PDX_a_82obo.png'));
    listDataAlbum.add(AlbumModel(
        id: 1,
        title: 'BOLERO',
        description: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png'));
    listDataAlbum.add(AlbumModel(
        id: 3,
        title: 'BOLERO',
        description: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png'));
    notifyListeners();
  }

  Future fetchAlbumAll() async {
    listViewAlbum.add(const ItemAlbumb(
        id: 0,
        tile: 'HIP HOP',
        describe: 'MUSIC',
        imageUrl: 'assets/images/unsplash_PDX_a_82obo.png'));
    listViewAlbum.add(const ItemAlbumb(
        id: 1,
        tile: 'BOLERO',
        describe: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png'));
    listViewAlbum.add(const ItemAlbumb(
        id: 2,
        tile: 'HIP HOP',
        describe: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png'));
    listViewAlbum.add(const ItemAlbumb(
        id: 3,
        tile: 'HIP HOP',
        describe: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png'));

    notifyListeners();
  }

  Future fetchMusicAll() async {
    listViewMusic.add(const ItemMusic(
        id: 1,
        type: 0,
        title: 'The last best1',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'making_my_way.mp3',
        isLoadSound: true));
    listViewMusic.add(const ItemMusic(
        id: 2,
        type: 1,
        title: 'The last best2',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'Infinity.mp3',
        isLoadSound: false));
    listViewMusic.add(const ItemMusic(
        id: 3,
        type: 1,
        title: 'The last best3',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listViewMusic.add(const ItemMusic(
        id: 4,
        type: 1,
        title: 'The last best4',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listViewMusic.add(const ItemMusic(
        id: 5,
        type: 0,
        title: 'The last best5',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    notifyListeners();
  }

  void setShowSheet(bool x) {
    _showSheet = x;
    notifyListeners();
  }

  void toggleSheetVisibility() {
    _showSheet = !_showSheet;
    notifyListeners();
  }

  void showSheetView(BuildContext context, String title, String author,
      String imageUrl, String pathMusic) {
    // get the current text theme with updated display color
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    // show a bottom sheet and store the returned controller object
    sheetController = showBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          // create a card with elevation and no margin
          return SizedBox(
            height: 60,
            child: Column(
              children: [
                Container(
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(203, 197, 197, 0.51),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, top: 8.0, bottom: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  Text(author),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Assets.icons.vtLets.svg(),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Selector<AudioProvider, PlayerState>(
                              selector: (context, model) =>
                                  model.audioPlayerState,
                              builder: (context, count, child) {
                                return GestureDetector(
                                  onTap: () {
                                    if (count == PlayerState.playing) {
                                      Provider.of<AudioProvider>(context,
                                              listen: false)
                                          .pause();
                                    } else {
                                      Provider.of<AudioProvider>(context,
                                              listen: false)
                                          .resum();
                                    }
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      child: count == PlayerState.playing
                                          ? const Icon(Icons.pause)
                                          : Assets.icons.vtPlay.svg()),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 0),
                              child: Assets.icons.vtRight.svg(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });

    // set a callback function to be called when the bottom sheet is closed
    sheetController.closed.then((value) {
      // update state to indicate that the sheet is no longer being shown
      setShowSheet(false);
      Provider.of<AudioProvider>(context, listen: false).stop();
    });
  }
}
