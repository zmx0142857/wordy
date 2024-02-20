import 'package:flutter/material.dart';
import 'package:wordy/models/word.dart';
import 'package:wordy/utils.dart';

class WordListComponent extends StatefulWidget {
  const WordListComponent({
    super.key,
    required this.words,
  });

  final List<WordItem> words;

  @override
  State<WordListComponent> createState() => _WordListComponentState();
}

class _WordListComponentState extends State<WordListComponent> {
  int _playingIndex = -1;

  _speakWord(int index) async {
    setState(() { _playingIndex = index; });
    String text = widget.words[index].text;
    await TtsUtils.speak(text);
    setState(() { _playingIndex = -1; });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}