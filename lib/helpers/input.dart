import 'dart:convert';
import 'dart:io';

abstract class Input {
  static String getUserInput(String message) {
    String? userInput;
    stdout.write(message);
    userInput = stdin.readLineSync(encoding: utf8);
    if (userInput == null || userInput == '') {
      stdout.write('Entrada invalida!\n');
      userInput = getUserInput(message);
    }
    return userInput.trim();
  }

  static String getUserInputNumbers(String message) {
    late String userInput;
    userInput = (Input.getUserInput(message));
    try {
      int.parse(userInput);
    } catch (e) {
      stdout.write('Número inválido!\n');
      userInput = getUserInputNumbers(message);
    }
    return userInput;
  }
}
