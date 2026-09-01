import 'helper.dart';

void main(List<String> args) {
  List<String> result = [];
  args.isEmpty ? result.add("") : decompress(args, result);
  print(result);
}

void decompress(List<String> args, List<String> result) {
  final String input = args.join('');
  String prevLetter = input[0].toUpperCase();
  int currentLetterCount = 0;

  for (final r in input.runes) {
    final ch = String.fromCharCode(r).toUpperCase();

    if (!Helper.isAlphaDe(ch) && !Helper.isDigit(ch)) {
      print('Invalid Input');
      break;
    }

    if (Helper.isAlphaDe(ch) && prevLetter == ch) {
      currentLetterCount++;
    } else if (prevLetter != ch && !Helper.isDigit(ch)) {
      for (int i = 0; i < currentLetterCount; i++) {
        result.add(prevLetter);
      }
      currentLetterCount = 1;
      prevLetter = ch;
    } else if (prevLetter != ch && Helper.isDigit(ch)) {
      int j = int.parse(ch);
      for (int i = 0; i < j; i++) {
        result.add(prevLetter);
      }
      currentLetterCount = 0;
    }
  }
  for (int i = 0; i < currentLetterCount; i++) {
    result.add(prevLetter);
  }
}
