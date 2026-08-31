import 'dart:io';
import 'dart:math';

import 'helper.dart';


class Dice {
  final int value;

  Dice(this.value);

}

List<Dice> trowGenerator(int numberOfRolls) {
  final random = Random();
  List<Dice> result = [];
  int sixCount = 0;
  for(int i = 0; i < numberOfRolls; i++){
    final value = random.nextInt(6) + 1;
    Dice dice = Dice(value);
    result.add(dice);
    if (dice.value == 6) {
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
  int max = 10;
  int numberOfRolls = 0;
  do {
    stdout.write('Number of rolls? Max quantity is ${max}\n');
    diceQuantity = stdin.readLineSync()?.trim() ?? '';
    if (Helper.isDigit(diceQuantity)){
      numberOfRolls = int.parse(diceQuantity);
    } else {
      stdout.write('Invalid input! Enter a number from 1 to $max\n');
      continue;
    }
    print('!!!');
    List<Dice> dice = trowGenerator(numberOfRolls);
    print(dice.map((d) => d.value).join(' '));
  } while(numberOfRolls < 1 || numberOfRolls > max);
}