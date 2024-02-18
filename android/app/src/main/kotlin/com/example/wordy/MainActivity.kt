package com.example.wordy

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.speech.tts.TextToSpeech
import android.util.Log
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import java.util.Locale

class MainActivity: FlutterActivity() {
  private val CHANNEL = "icould.fran/wordy"
  private lateinit var tts: TextToSpeech

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
      methodHandler(call, result)
    }
  }

  // This method is invoked on the main thread.
  private fun methodHandler (call: MethodCall, result: MethodChannel.Result) {
    if (call.method == "ttsSpeak") {
      val text = call.argument<String>("text") ?: ""
      val language = call.argument<String>("language") ?: ""
      val country = call.argument<String>("country") ?: ""
      val locale = Locale(language, country)
      ttsSpeak(text, locale, result)
    } else {
      result.notImplemented()
    }
  }

  private fun toast(text: String, length: Int = Toast.LENGTH_LONG) {
    Toast.makeText(context, text, length).show()
  }

  private fun ttsSpeak(text: String, locale: Locale, result: MethodChannel.Result) {
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      tts = TextToSpeech(context) {
        if (it == TextToSpeech.SUCCESS) {
          Log.i("TTS", "init success")
          // tts.language = locale
          val res = tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, null)
          if (res == TextToSpeech.SUCCESS) {
            Log.i("TTS", "speak success")
            result.success(0)
          } else {
            Log.e("TTS", "speak failed: $res")
            result.error("-1", "something went wrong", "")
          }
        } else {
          Log.e("TTS", "init failed: $it")
          toast("文本转语音初始化失败，请在系统设置 > 语言与输入法 > Text to Speech 中启用 TTS")
          result.error("-1", "something went wrong", "")
        }
      }
    } else {
      Log.e("TTS", "need sdk >= 21")
      result.error("-1", "ttsSpeak failed", "need sdk >= 21")
    }
  }

  override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
    if (tts != null) {
      tts.stop()
      tts.shutdown()
    }
    super.cleanUpFlutterEngine(flutterEngine)
  }
}
