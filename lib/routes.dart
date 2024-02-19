import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/tts.dart';

class RouteItem {
  final String url;
  final String title;
  final Widget Function(BuildContext) import;

  const RouteItem({
    required this.url,
    required this.title,
    required this.import,
  });
}

final routes = {
  '/': RouteItem(
    url: '/',
    title: '主页',
    import: (context) => const HomePage(),
  ),
  '/tts': RouteItem(
    url: '/tts',
    title: '文字转语音',
    import: (context) => const TtsPage(),
  ),
};
