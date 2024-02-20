import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordy/components/word_list.dart';
import 'package:wordy/models/word.dart';

enum WordCategory {
  faved, learned, todo, errors
}

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

  WordCategory _currentCategory = WordCategory.faved;

  _segmentTextStyle(WordCategory category) {
    return category == _currentCategory
      ? TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.secondary)
      : TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onInverseSurface);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CupertinoSlidingSegmentedControl<WordCategory>(
          children: {
            WordCategory.faved: Text('收藏', style: _segmentTextStyle(WordCategory.faved)),
            WordCategory.learned: Text('已学', style: _segmentTextStyle(WordCategory.learned)),
            WordCategory.todo: Text('未学', style: _segmentTextStyle(WordCategory.todo)),
            WordCategory.errors: Text('易错', style: _segmentTextStyle(WordCategory.errors)),
          },
          groupValue: _currentCategory,
          onValueChanged: (WordCategory? value) {
            setState(() {
              _currentCategory = value ?? WordCategory.faved;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('onPressed');
            },
          ),
        ],
      ),
      body: WordListComponent(
        words: widget.words
      ),
    );
  }
}