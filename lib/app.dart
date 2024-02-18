import 'package:flutter/material.dart';
import 'pages/counter.dart';
import 'pages/tts.dart';
import 'pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TtsPage(),
      routes: {
        '/': (context) => const HomePage(),
        '/counter': (context) => const CounterPage(),
        '/tts': (context) => const TtsPage(),
      }
    );
  }
}
