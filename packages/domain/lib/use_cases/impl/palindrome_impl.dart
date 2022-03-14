import '../interfaces/palindrome_case.dart';

class PalindromeCaseImpl extends PalindromeCase<String, Future<bool>> {
  @override
  Future<bool> call(String text) async {
    await Future.delayed(const Duration(seconds: 5));
    text = text.trim();
    if (text == text.split('').reversed.join('') && text != "") {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
