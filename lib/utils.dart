import 'package:flutter_tts/flutter_tts.dart';

class TtsUtils {
  static final FlutterTts _tts = FlutterTts();

  static speak(String text, {language = '', sleep = 2}) async {
    if (language.isNotEmpty) {
      await _tts.setLanguage(language);
    }
    if (text.isNotEmpty) {
      await _tts.speak(text);
    }
    if (sleep > 0) {
      await Future.delayed(Duration(seconds: sleep));
    }
  }

  static getLanguages() async {
    return (await _tts.getLanguages).map((lang) => lang.split('-').first).toSet().toList().cast<String>();
  }
}