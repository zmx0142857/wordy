import 'package:wordy/models/word.dart';

import 'models/route.dart';
import 'pages/word_detail.dart';
import 'pages/word_list.dart';
import 'pages/home.dart';
import 'pages/tts.dart';

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
  '/word_list': RouteItem(
    url: '/word_list',
    title: '单词表',
    import: (context) => WordListPage(
      words: mockWords,
    ),
  ),
  '/word_detail': RouteItem(
    url: '/word_detail',
    title: '单词详情',
    import: (context) => const WordDetailPage(),
  )
};
