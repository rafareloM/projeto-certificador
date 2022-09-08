import 'dart:io';

class Input {
  static bool validateInt(input) {
    try {
      int.parse(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  static String getUserInput(String message) {
    String? userInput;
    stdout.write(message);
    userInput = stdin.readLineSync();
    if (userInput == null || userInput == '') {
      stdout.write('Entrada invalida!\n');
      userInput = getUserInput(message);
    }
    return userInput;
  }

  static int getUserInputToInt(String message) {
    String? userInput;
    late int input;
    userInput = (getUserInput(message));
    try {
      input = int.parse(userInput);
    } catch (e) {
      stdout.write('Número invalido!\n');
      input = getUserInputToInt(message);
    }
    return input;
  }

  static String getUserInputToIntPossibleZero(String message) {
    late String userInput;
    int input;
    userInput = (getUserInput(message));
    if (userInput.split('').first == '0') {
      try {
        input = int.parse(userInput);
        userInput = '0$input';
      } catch (e) {
        stdout.write('Número invalido!\n');
        userInput = getUserInputToIntPossibleZero(message);
      }
    } else {
      try {
        input = int.parse(userInput);
      } catch (e) {
        stdout.write('Número invalido!\n');
        userInput = getUserInputToIntPossibleZero(message);
      }
    }
    return userInput;
  }
}
