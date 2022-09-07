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
    do {
      userInput = stdin.readLineSync();
      if (userInput == '') {
        stdout.write('Entrada invalida.\n');
        userInput = getUserInput(message);
      }
    } while (userInput == null);
    return userInput;
  }

  static int getUserInputToInt(String message) {
    String? userInput;
    int? input;
    userInput = (getUserInput(message));
    do {
      try {
        input = int.parse(userInput!);
      } catch (e) {
        stdout.write('Número invalido.\n');
        userInput = getUserInput(message);
      }
    } while (input == null);
    return input;
  }
}
