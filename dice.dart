import 'dart:io';
import 'dart:math';


class Dice {
  late final int sequenceNumber;
  late final int _value;

  Dice(i){
    this.sequenceNumber = i;
  }

  get value => _value;

  int get get => this._value;

  void set(int value) {
    _value = value;
  }
}

List<Dice> trowGenerator(int numberOfRolls) {
  final random = Random();
  List<Dice> result = [];
  int sixCount = 0;
  for(int i = 0; i < numberOfRolls; i++){
    Dice dice = Dice(i);
    dice.set(random.nextInt(6) + 1);
    result.add(dice);
    if (dice.get == 6) {
      sixCount++;
      if (sixCount == 2) {
        print('Limit erreicht');
        break;
      }
    } else {
      sixCount = 0;
    }
  }
  return result;
}

void main() {
  String diceQuantity;
  int max = 5;
  while(true) {
    stdout.write('Number of rolls? Max quantity is ${max}\n');
    diceQuantity = stdin.readLineSync()?.trim() ?? '';
    final numberOfRolls = int.tryParse(diceQuantity);
    if (numberOfRolls == null || numberOfRolls < 1 || numberOfRolls > max) {
      stdout.write('Enter a number from 1 to $max\n');
      continue;
    } else {
      List<Dice> dice = trowGenerator(numberOfRolls);
      print(dice.map((d) => d.get).join(' '));
      break;
    }
  }
}