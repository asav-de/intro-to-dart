import 'greeter.dart' show isAlphaDe;
import 'greeter.dart' show isDigit;
void main(List<String> args) {
  List<String> result = [];
  args.isEmpty ? result.add("") : decompress(args, result);
  print(result);
}

decompress(List<String> args, List<String> result) {
  final String input = args.join('');
  String prevLetter = input[0].toUpperCase();
  int currentLetterCount = 0;

  for (final r in input.runes){
    final ch = String.fromCharCode(r).toUpperCase();

    if (!isAlphaDe(ch) && !isDigit(ch)){
      print('Invalid Input');
      break;
    }

    if (isAlphaDe(ch) && prevLetter == ch){
      currentLetterCount++;
    } else if(prevLetter != ch && !isDigit(ch)){
      for (int i = 0; i < currentLetterCount; i++) {
        result.add(prevLetter);
      }
      currentLetterCount = 1;
      prevLetter = ch;
    } else if (prevLetter != ch && isDigit(ch)){
      int j = int.parse(ch);
      for (int i = 0; i < j; i++){
        result.add(prevLetter);
      }
      currentLetterCount = 0;
    }
  }
  for (int i = 0; i < currentLetterCount; i++) {
    result.add(prevLetter);
  }
}