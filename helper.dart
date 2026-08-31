abstract class Helper {
  static bool isAlphaDe(String s) => RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(s);
  static bool isDigit(String s) => RegExp(r'^[0-9]+$').hasMatch(s);

  static String geschlechtChecker(input) {
    String g = input.isEmpty ? '' : input[0].toLowerCase();
    Map<String, String> geschlecht = {'m': 'Herr', 'w': 'Frau', 'd': ''};
    return geschlecht[g] ?? 'ohne/keine Angabe';
  }
}