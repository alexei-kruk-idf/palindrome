import 'dart:async';

import 'package:domain/use_cases/impl/palindrome_impl.dart';

class PalindromeBlock {
  final PalindromeCaseImpl _palindromeUseCase;

  PalindromeBlock(this._palindromeUseCase) {
    _inputStreamController.stream.listen(_checkPalindrome);
  }

  final _inputStreamController = StreamController<String>();
  StreamSink<String> get inputStreamSink => _inputStreamController.sink;

  final _outputStreamController = StreamController<String>();
  Stream<String> get outputStreamSink => _outputStreamController.stream;

  void dispose() {
    _inputStreamController.close();
    _outputStreamController.close();
  }

  void _checkPalindrome(String text) {
    final isPalindrome = _palindromeUseCase(text);
    var textResult = text.trim();
    if (isPalindrome) {
      textResult = "Это палиндром";
    } else {
      textResult = "Это не палиндром";
    }
    _outputStreamController.add(textResult);
  }
}
