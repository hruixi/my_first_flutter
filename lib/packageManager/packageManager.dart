
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

class RandomWordsWidget extends StatelessWidget {
  const RandomWordsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(wordPair.toString()),
      ),
    );
  }
}