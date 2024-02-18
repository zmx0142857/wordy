import 'dart:developer';

import 'package:flutter/services.dart';

class PlatformChannel {
  static const name = 'icould.fran/wordy'; // 方法通道名称, 和 kotlin 代码保持一致！
  static const MethodChannel channel = MethodChannel(name);

  static ttsSpeak(text, {language, country}) async {
    try {
      await channel.invokeMethod('ttsSpeak', {"text": text, "language": language, "country": country});
    } on PlatformException catch (e) {
      log('ttsSpeak failed: ${e.message}');
    }
  }
}
