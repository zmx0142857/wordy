import 'package:flutter/material.dart';
import 'package:wordy/platform_channel.dart';

class TtsPage extends StatefulWidget {
  const TtsPage({super.key});

  @override
  State<TtsPage> createState() => _TtsPageState();
}

class _TtsPageState extends State<TtsPage> {
  bool _playing = false;
  String _text = '';

  _ttsSpeak() async {
    setState(() { _playing = true; });
    await PlatformChannel.ttsSpeak('你好', language: 'zh', country: 'CN');
    setState(() { _playing = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TtsPage'),
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _text.isEmpty ? null : _ttsSpeak,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Text to speech'),
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