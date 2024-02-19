import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsPage extends StatefulWidget {
  const TtsPage({super.key});

  @override
  State<TtsPage> createState() => _TtsPageState();
}

const Map<String, String> languageDict = {
  '': '自动',
  'zh': '中文',
  'en': '英文',
};

const _defaultLanguage = '';

class _TtsPageState extends State<TtsPage> {
  bool _playing = false;
  String _text = '';
  final FlutterTts _tts = FlutterTts();
  List<String> _languages = [];
  String _language = _defaultLanguage;

  _ttsSpeak() async {
    setState(() { _playing = true; });
    if (_language.isNotEmpty) {
      _tts.setLanguage(_language);
    }
    await _tts.speak(_text);
    setState(() { _playing = false; });
  }

  _initLanguages() async {
    _languages = [
      '',
      ...(await _tts.getLanguages).map((lang) => lang.split('-').first).toSet().toList().cast<String>(),
    ];
    setState(() {});
  }

  _showDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('选择语言', style: Theme.of(context).textTheme.headlineSmall),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return SizedBox(
                width: double.maxFinite,
                height: 250,
                child: ListView(
                  children: _languages.map((lang) {
                    return RadioListTile<String>(
                      title: Text(languageDict[lang] ?? lang),
                      value: lang,
                      groupValue: _language,
                      onChanged: (String? value) {
                        _language = value ?? _defaultLanguage;
                        setDialogState(() {});
                        setState(() {});
                        Timer(const Duration(milliseconds: 100), () => Navigator.pop(context));
                      },
                    );
                  }).toList(),
                ),
              );
            }
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文字转语音'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              minLines: 4,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text content',
              ),
              onChanged: (text) {
                setState(() {
                  _text = text;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _showDialog,
                  child: Text('语言: ${languageDict[_language] ?? _language}'),
                ),
                ElevatedButton(
                  onPressed: _text.isEmpty ? null : _ttsSpeak,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('文字转语音'),
                      Icon(_playing ? Icons.stop : Icons.play_arrow),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}