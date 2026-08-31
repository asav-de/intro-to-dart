import 'dart:io';

import 'helper.dart';

class Person {
  final String vorname;
  final String nachname;
  final int alter;
  final String geschlecht;

  Person(this.vorname, this.nachname, this.alter, this.geschlecht);

  static createPersonFromInput() {
    String vorname = _eingabeChecker('vorname');
    String nachname = _eingabeChecker('nachname');
    int alter = int.tryParse(_eingabeChecker('alter')) ?? 0;
    String geschlecht = _eingabeChecker('geschlecht');
    return Person(vorname, nachname, alter, geschlecht);
  }

void greeting(tagesZeit) {
  switch (this.geschlecht) {
    case 'Herr':
      print('Guten ${tagesZeit}, ${this.geschlecht} ${this.nachname}!');
      break;
    case 'Frau':
      print('Guten ${tagesZeit}, ${this.geschlecht} ${this.nachname}!');
      break;
    default:
      print('Guten ${tagesZeit}, ${this.vorname} ${this.nachname}!');
  }
}


  static String _eingabeChecker(String inputKind) {
    var age;
    var geschlecht;
    dynamic input;
    while (true) {
      switch (inputKind) {
        case 'vorname':
          stdout.write(inputKind + ": ");
          input = stdin.readLineSync()?.trim() ?? '';
          if (input.isEmpty) {
            stdout.write(inputKind + " can't be empty\n");
            continue;
          } else if (Helper.isAlphaDe(input)) {
            return input;
          }
          stdout.write(inputKind + ' is Wrong\n');
          continue;
        case 'nachname':
          stdout.write(inputKind + ": ");
          input = stdin.readLineSync()?.trim() ?? '';
          if (input.isEmpty) {
            stdout.write(inputKind + " can't be empty\n");
            continue;
          } else if (Helper.isAlphaDe(input)) {
            return input;
          }
          stdout.write(inputKind + ' is Wrong\n');
          continue;
        case 'alter':
          stdout.write(inputKind + ": ");
          input = stdin.readLineSync()?.trim() ?? '';
          if (input.isEmpty) {
            stdout.write(inputKind + " can't be empty\n");
            continue;
          }
          if (Helper.isDigit(input)) {
            age = int.tryParse(input);
            if (age != null && age >= 0 && age <= 150) {
              return input;
            }
          }
          stdout.write(inputKind + ' is Wrong\n');
          continue;
        case 'geschlecht':
          stdout.write(inputKind + " (m/w/d): ");
          input = stdin.readLineSync()?.trim() ?? '';
          geschlecht = Helper.geschlechtChecker(input);
          return geschlecht;
        default:
          stdout.write(inputKind + ' is Wrong!\n');
      }
    }
  }
}


void main() {
  final person = Person.createPersonFromInput();
  person.createPersonFromInput();

  greetChecker(person);
}

void greetChecker(Person person) {
  DateTime now = DateTime.now();
  int hour = now.hour;
  String tagesZeit;
  if (person.alter <= 40) {
    print('Hallo ${person.vorname}!');
  } else if (hour >= 6 && hour < 12) {
    tagesZeit = 'Morgen';
    person.greeting(tagesZeit);
  } else if (hour >= 12 && hour < 18) {
    tagesZeit = 'Tag';
    person.greeting(tagesZeit);
  } else if (hour >= 18 && hour < 23) {
    tagesZeit = 'Abend';
    person.greeting(tagesZeit);
  }
}
