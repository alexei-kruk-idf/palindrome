import 'dart:async';

import 'package:domain/use_cases/impl/palindrome_impl.dart';

class PalindromeBloc {
  final PalindromeCaseImpl _palindromeUseCase;

  PalindromeBloc(this._palindromeUseCase);

  final _outputStreamController = StreamController<String>();
  Stream<String> get outputStreamSink => _outputStreamController.stream;

  void dispose() {
    _outputStreamController.close();
  }

  void checkPalindrome(String text) {
    final isPalindrome = _palindromeUseCase(text);
    String textResult;
    if (isPalindrome) {
      textResult = "Это палиндром";
    } else {
      textResult = "Это не палиндром";
    }
    _outputStreamController.add(textResult);
  }
}
