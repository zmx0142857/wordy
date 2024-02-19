class WordItem {
  final String text;
  final String pronunciation;
  final String meaning;

  WordItem({
    required this.text,
    required this.pronunciation,
    required this.meaning,
  });

  factory WordItem.fromJson(Map<String, dynamic> json) {
    return WordItem(
      text: json['text'],
      pronunciation: json['pronunciation'],
      meaning: json['meaning'],
    );
  }
}

final List<WordItem> mockWords = [
  WordItem(text: 'apple', pronunciation: 'ˈæpl', meaning: '苹果'),
  WordItem(text: 'banana', pronunciation: 'bəˈnɑːnə', meaning: '香蕉'),
  WordItem(text: 'cherry', pronunciation: 'ˈtʃeri', meaning: '樱桃'),
  WordItem(text: 'date', pronunciation: 'deɪt', meaning: '枣'),
  WordItem(text: 'elderberry', pronunciation: 'ˈeldəberi', meaning: '接骨木'),
  WordItem(text: 'apple', pronunciation: 'ˈæpl', meaning: '苹果'),
  WordItem(text: 'banana', pronunciation: 'bəˈnɑːnə', meaning: '香蕉'),
  WordItem(text: 'cherry', pronunciation: 'ˈtʃeri', meaning: '樱桃'),
  WordItem(text: 'date', pronunciation: 'deɪt', meaning: '枣'),
  WordItem(text: 'elderberry', pronunciation: 'ˈeldəberi', meaning: '接骨木'),
  WordItem(text: 'apple', pronunciation: 'ˈæpl', meaning: '苹果'),
  WordItem(text: 'banana', pronunciation: 'bəˈnɑːnə', meaning: '香蕉'),
  WordItem(text: 'cherry', pronunciation: 'ˈtʃeri', meaning: '樱桃'),
  WordItem(text: 'date', pronunciation: 'deɪt', meaning: '枣'),
  WordItem(text: 'elderberry', pronunciation: 'ˈeldəberi', meaning: '接骨木'),
  WordItem(text: 'apple', pronunciation: 'ˈæpl', meaning: '苹果'),
  WordItem(text: 'banana', pronunciation: 'bəˈnɑːnə', meaning: '香蕉'),
  WordItem(text: 'cherry', pronunciation: 'ˈtʃeri', meaning: '樱桃'),
  WordItem(text: 'date', pronunciation: 'deɪt', meaning: '枣'),
  WordItem(text: 'elderberry', pronunciation: 'ˈeldəberi', meaning: '接骨木'),
];
