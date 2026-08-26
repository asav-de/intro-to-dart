import 'dart:io';

class Greeter {
  late final String vorname;
  late final String nachname;
  late final int alter;
  late final String geschlecht;

  Greeter() {
    this.vorname = eingabeChecker('vorname');
    this.nachname = eingabeChecker('nachname');
    this.alter = int.parse(eingabeChecker('alter'));
    this.geschlecht = eingabeChecker('geschlecht');
  }
}

String eingabeChecker(String inputKind) {
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
    case 'nachname':
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
    case 'alter':
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
    case 'geschlecht':
      stdout.write(inputKind + " (m/w/d): ");
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
    'm' : 'Herr',
    'w' : 'Frau',
    'd' : '',
  };
  return geschlecht[g] ?? 'ohne/keine Angabe';
}

void main() {
  Greeter greeter = Greeter();
  greetChecker(greeter);
}

void greetChecker(Greeter greeter) {
  DateTime now = DateTime.now();
  int hour = now.hour;
  String tagesZeit;
  if (greeter.alter <= 40) {
    print('Hallo ${greeter.vorname}!');
  } else if (hour >= 6 && hour < 12){
      tagesZeit = 'Morgen';
      greeting(greeter, tagesZeit);
    } else if (hour >= 12 && hour < 18) {
      tagesZeit = 'Tag';
      greeting(greeter, tagesZeit);
    } else if (hour >= 18 && hour < 23){
      tagesZeit = 'Abend';
      greeting(greeter, tagesZeit);
    }
}

void greeting(Greeter greeter, String tagesZeit) {
  switch (greeter.geschlecht) {
  case 'Herr':
    print('Guten ${tagesZeit}, ${greeter.geschlecht} ${greeter.nachname}!');
    break;
  case 'Frau':
    print('Guten ${tagesZeit}, ${greeter.geschlecht} ${greeter.nachname}!');
    break;
  default:
    print('Guten ${tagesZeit}, ${greeter.vorname} ${greeter.nachname}!');
  }
}