import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofitapi_flutter/pages/audio/audio_provider_viewmodel.dart';
import 'base/di/locator.dart';
import 'main_viewmodel.dart';
import 'pages/home_page.dart';

void main() {
  setUpInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainVM>(create: (_) => MainVM()),
        ChangeNotifierProvider<AudioProvider>(create: (_) => AudioProvider()),
      ],
      child: MaterialApp(
        title: 'FULL API - RETROFIT',
        theme: ThemeData(
          brightness: Brightness.light, // Chủ đề sáng
          // Các thuộc tính khác của chủ đề sáng
        ),
        themeMode: ThemeMode.system,
        home: const MyHomePage(title: 'Music app',
        ),
        // const MyHomePage(title: 'FETCH API RETROFIT - DIO'),
      ),
    );
  }
}
