import 'package:flutter/material.dart';
import 'package:retrofitapi_flutter/base/base_page.dart';
import 'package:retrofitapi_flutter/pages/home_viewmodel.dart';

import '../gen/assets.gen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with MixinBasePage<HomeVM> {
  // This variable will hold a reference to the bottom sheet controller.
  late PersistentBottomSheetController sheetController;

// This variable will hold a reference to the scaffold context.
  late BuildContext _scaffoldCtx;

// This boolean variable will determine whether the bottom sheet is currently visible or not.
  bool showSheet = false;

  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
              "Music Players",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 8.0),
                  child: Text(
                    'Top Albumb',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                        height: 340,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            itemCount: provider.listViewAlbum.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.white,
                                  child: provider.listViewAlbum[index]);
                            }))),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, bottom: 8.0),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    height: 240,
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
                    ))
              ],
            ),
          ),
        ));
  }

  @override
  HomeVM create() {
    return HomeVM();
  }

  @override
  void initialise(BuildContext context) {}
}
