import 'package:domain/use_cases/model/palindrome_response.dart';

abstract class INetworkRepository {
  Future<PalindromeResponse> checkPalindrome(String palindrome);
}
