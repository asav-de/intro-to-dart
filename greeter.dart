import 'dart:io';

class Greeter {
  late final String vorname;
  late final String Nachname;
  late final int Alter;
  late final String Geschlecht;

  Greeter() {
    this.vorname = checkerEingabe('vorname');
    this.Nachname = checkerEingabe('Nachname');
    this.Alter = int.parse(checkerEingabe('Alter'));
    this.Geschlecht = checkerEingabe('Geschlecht');
  }
}

String checkerEingabe(String inputKind) {
  var age;
  var geschlecht;
  dynamic input;
  while(true){
      switch (inputKind) {
    case 'vorname':
      stdout.write(inputKind + ": ");
      input = stdin.readLineSync()?.trim() ?? '';
      if (input.isEmpty ){
        stdout.write(inputKind + " can't be empty\n");
        continue;
      } else if (isAlphaDe(input)){
        return input;
      }
      stdout.write(inputKind + ' is Wrong\n');
      continue;
    case 'Nachname':
      stdout.write(inputKind + ": ");
      input = stdin.readLineSync()?.trim() ?? '';
      if (input.isEmpty){
        stdout.write(inputKind + " can't be empty\n");
        continue;
      } else if (isAlphaDe(input)){
        return input;
      }
      stdout.write(inputKind + ' is Wrong\n');
      continue;
    case 'Alter':
      stdout.write(inputKind + ": ");
      input = stdin.readLineSync()?.trim() ?? '';
      if (input.isEmpty){
        stdout.write(inputKind + " can't be empty\n");
        continue;
      } 
      if (isDigit(input)){
        age = int.tryParse(input);
        if (age != null && age >= 0 && age <= 150){
        return input;
        }
      } 
      stdout.write(inputKind + ' is Wrong\n'); 
      continue;
    case 'Geschlecht':
      stdout.write(inputKind + ": ");
      input = stdin.readLineSync()?.trim() ?? '';
      geschlecht = geschlechtChecker(input);
      return geschlecht;
    default:
      stdout.write(inputKind + ' is Wrong!\n');
    } 
  }
}


bool isAlphaDe(String s) => RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(s);
bool isDigit(String s) => RegExp(r'^[0-9]+$').hasMatch(s);

String geschlechtChecker(input) {
  String g = input.isEmpty ? '' : input[0].toLowerCase();
  Map<String, String> geschlecht = {
    'm' : 'männlich',
    'w' : 'weiblich',
    'd' : 'divers',
  };
  return geschlecht[g] ?? 'ohne/keine Angabe';
}

void main() {
  Greeter greeter = Greeter();
  if (greeter.Alter < 40) {
    print('Hallo ${greeter.vorname}!');
  }
}