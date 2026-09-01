import 'helper.dart';

void main(List<String> args) {
  List<String> result = [];
  args.isEmpty ? result.add("") : compress(args, result);
  print(result);
}

void compress(List<String> args, result) {
  int currentLetterCount = 0;
  final String input = args.join('');
  String prevLetter = input[0].toUpperCase();

  for (final r in input.runes) {
    final ch = String.fromCharCode(r).toUpperCase();

    if (!Helper.isAlphaDe(ch)) {
      print('Invalid Input!');
      break;
    }

    if (Helper.isAlphaDe(ch) && prevLetter == ch) {
      currentLetterCount++;
    } else if (prevLetter != ch && currentLetterCount < 3) {
      for (int i = 0; i < currentLetterCount; i++) {
        result.add(prevLetter);
      }
      prevLetter = ch;
      currentLetterCount = 1;
    } else if (prevLetter != ch && currentLetterCount >= 3) {
      result.add(prevLetter);
      result.add(currentLetterCount.toString());
      prevLetter = ch;
      currentLetterCount = 1;
    }
  }

  if (currentLetterCount < 3) {
    for (int i = 0; i < currentLetterCount; i++) {
      result.add(prevLetter);
    }
  } else {
    result.add(prevLetter);
    result.add(currentLetterCount.toString());
  }
}
