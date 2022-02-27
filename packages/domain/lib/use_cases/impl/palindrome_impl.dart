import '../interfaces/palindrome_case.dart';

class PalindromeCaseImpl extends PalindromeCase {
  @override
  Future<bool> call(String text) async {
    text = text.trim();
    if (text == text.split('').reversed.join('') && text != "") {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
