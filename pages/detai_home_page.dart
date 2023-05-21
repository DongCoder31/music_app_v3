import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../../gen/assets.gen.dart';
import '../base/base_page.dart';
import 'home_viewmodel.dart';

class DetailAlbumbScreen extends StatefulWidget {
  const DetailAlbumbScreen({super.key, required this.data});

  final int data;

  @override
  State<DetailAlbumbScreen> createState() => _DetailAlbumbScreenState();
}

class _DetailAlbumbScreenState extends State<DetailAlbumbScreen>
    with MixinBasePage<HomeVM> {
  bool _showSheet = true;
  late PersistentBottomSheetController sheetController;

  bool get showSheet => _showSheet;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return builder(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            elevation: 0,
            centerTitle: true,
            leading: Container(
              margin: const EdgeInsets.only(left: 30),
              child: Assets.icons.drawer.svg(),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 29),
                child: Assets.icons.search.svg(),
              )
            ],
            title: const Text(
              "Music Player",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          body: Stack(children: [
            FadeInDown(
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: width,
                height: height / 2.4,
                decoration: const BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(1000),
                        bottomLeft: Radius.circular(1000))),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 140.0),
                    child: SizedBox(
                        height: 280,
                        child: Container(
                          width: 240.0,
                          height: 280.0,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[4],
                            color: Theme.of(context).bottomAppBarColor,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(provider
                                  .listDataAlbum[widget.data].imageUrl
                                  .toString()),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ))),
                const SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    provider.listDataAlbum[widget.data].title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    provider.listDataAlbum[widget.data].description.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 8.0),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                      child: SizedBox(
                          // width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(8),
                              itemCount: provider.listViewMusic.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    // width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    child: provider.listViewMusic[index]);
                              })),
                    )),
                const SizedBox(
                  height: 28.0,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
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
                                padding: const EdgeInsets.only(
                                    left: 40.0, right: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            child: Image.asset(
                                              'assets/images/unsplash_PDX_a_82obo.png',
                                              fit: BoxFit.cover,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 14.0,
                                              top: 8.0,
                                              bottom: 16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'The last best3',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text('jack'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: Assets.icons.vtLets.svg(),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: Assets.icons.vtPlay.svg(),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 0),
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
                      )),
                )
              ],
            )
          ]),
        ));
  }

  @override
  create() {
    return HomeVM();
  }

  @override
  void initialise(BuildContext context) {}
}
