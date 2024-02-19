import 'package:flutter/material.dart';
import 'package:wordy/models/word.dart';
import 'package:wordy/utils.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({
    super.key,
    required this.words,
  });

  final List<WordItem> words;

  @override
  State<WordListPage> createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  int _playingIndex = -1;

  _speakWord(int index) async {
    setState(() { _playingIndex = index; });
    String text = widget.words[index].text;
    await TtsUtils.speak(text);
    setState(() { _playingIndex = -1; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('单词表'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('onPressed');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.words.length,
        itemBuilder: (context, index) {
          WordItem word = widget.words[index];
          return ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(word.text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8.0),
                Text('[${word.pronunciation}]', style: TextStyle(color: Colors.grey[600], fontSize: 16)),
              ],
            ),
            subtitle: Text(word.meaning, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            trailing: IconButton(
              icon: Icon(index == _playingIndex ? Icons.volume_up : Icons.volume_down),
              onPressed: () {
                _speakWord(index);
              },
            ),
            onTap: () {
              Navigator.pushNamed(context, '/word_detail', arguments: word);
            },
          );
        },
      ),
    );
  }
}