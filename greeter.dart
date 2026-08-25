import 'dart:io';

class Greeter {
  late final String vorname;
  late final String nachname;
  late final int alter;
  late final String geschlecht;

  Greeter() {
    this.vorname = checkerEingabe('vorname');
    this.nachname = checkerEingabe('nachname');
    this.alter = int.parse(checkerEingabe('alter'));
    this.geschlecht = checkerEingabe('geschlecht');
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
    'm' : 'Herr',
    'w' : 'Frau',
    'd' : '',
  };
  return geschlecht[g] ?? 'ohne/keine Angabe';
}

void begrussung(String tagesZeit, Greeter greeter) {
  print('Guten ${tagesZeit}, ${greeter.geschlecht}, ${greeter.nachname}!');
}

void main() {
  DateTime now = DateTime.now();
  int hour = now.hour;
  String tagesZeit;  
  print(hour);
  Greeter greeter = Greeter();
  print('Greeter Geschlecht: ${greeter.geschlecht}');
  if (greeter.alter <= 40) {
    print('Hallo ${greeter.vorname}!');
  } else if (hour >= 6 && hour < 12){
      tagesZeit = 'Morgen';
      switch (greeter.geschlecht) {
        case 'Herr':
          begrussung(tagesZeit, greeter);
          break;
        case 'Frau':
          begrussung(tagesZeit, greeter);
          break;
        default:
          print('Guten ${tagesZeit}, ${greeter.vorname} ${greeter.nachname}!');
      }
    } else if (hour >= 12 && hour < 18) {
      tagesZeit = 'Tag';
        switch (greeter.geschlecht) {
          case 'Herr':
            begrussung(tagesZeit, greeter);
            break;
          case 'Frau':
            begrussung(tagesZeit, greeter);
          default:
            print('Guten ${tagesZeit}, ${greeter.vorname} ${greeter.nachname}!');
        } 
    } else if (hour >= 18 && hour < 23){
        tagesZeit = 'Abend';
        switch (greeter.geschlecht) {
          case 'Herr':
            begrussung(tagesZeit, greeter);
            break;
          case 'Frau':
            begrussung(tagesZeit, greeter);
            break;
          default:
            print('Guten ${tagesZeit}, ${greeter.vorname} ${greeter.nachname}!');
        }
    }
}
