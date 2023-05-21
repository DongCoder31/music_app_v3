import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofitapi_flutter/pages/audio/audio_provider_viewmodel.dart';

import '../gen/assets.gen.dart';
import '../pages/home_viewmodel.dart';

class ItemMusic extends StatelessWidget {
  const ItemMusic(
      {super.key,
      required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.time,
      required this.author,
      required this.imageUrl,
      required this.isLoadSound,
      required this.pathMusic});

  final String title, description, time, author, imageUrl, pathMusic;
  final bool isLoadSound;
  final int id, type;

  @override
  Widget build(BuildContext context) {
    final myData = context.watch<HomeVM>();
    final audio = context.watch<AudioProvider>();

    return GestureDetector(
        onTap: () {
          myData.toggleSheetVisibility();
          if (myData.showSheet) {
            myData.showSheetView(context, title, author, imageUrl, pathMusic);
            audio.playPause(pathMusic);
            // Show the sheet if it's not already showing
          } else {
            Navigator.pop(context); // Close the sheet if it's already showing
          }
        },
        child: Container(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    shadowColor: Colors.grey,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Column(
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
                  const SizedBox(
                    width: 10,
                  ),
                  Text(time),
                  const SizedBox(
                    width: 20,
                  ),
                  Assets.icons.group.svg(),
                  const SizedBox(
                    width: 30,
                  ),
                  Assets.icons.vector4.svg(),
                ],
              ),
              if (isLoadSound)
                Slider(
                  value: audio.position.inSeconds.toDouble(),
                  max: 237,
                  onChanged: (value) {
                    audio.seek(Duration(seconds: value.toInt()));
                  },
                )
            ],
          ),
        ));
  }
}
