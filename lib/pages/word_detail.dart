import 'package:flutter/material.dart';
import 'package:wordy/models/word.dart';
import 'package:wordy/utils.dart';

class WordDetailPage extends StatefulWidget {
  const WordDetailPage({super.key});

  @override
  State<WordDetailPage> createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> {
  bool _playing = false;

  _speakWord(String text) async {
    setState(() { _playing = true; });
    await TtsUtils.speak(text);
    setState(() { _playing = false; });
  }

  @override
  Widget build(BuildContext context) {
    final WordItem word = ModalRoute.of(context)!.settings.arguments as WordItem;
    return Scaffold(
      appBar: AppBar(
        title: const Text('单词详情'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.maxFinite),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                  child: ListTile(
                    title: Text(
                        word.text,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    subtitle: Text(
                      '[${word.pronunciation}]',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(_playing ? Icons.volume_up : Icons.volume_down),
                      onPressed: () {
                        _speakWord(word.text);
                      },
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                  child: Text(word.meaning, style: const TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}