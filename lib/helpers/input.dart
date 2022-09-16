import 'dart:io';

abstract class Input {
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
}
