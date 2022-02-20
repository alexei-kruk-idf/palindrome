import 'package:palindrome/domain/use_cases/interfaces/palindrome_case.dart';

class PalindromeCaseImpl extends PalindromeCase {
  @override
  bool isPalindrome(String text) {
    text = text.trim();
    if (text == text.split('').reversed.join('') && text != "") {
      return true;
    } else {
      return false;
    }
  }
}
