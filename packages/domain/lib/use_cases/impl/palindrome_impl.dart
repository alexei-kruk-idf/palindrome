import 'package:domain/use_cases/interfaces/palindrome_case.dart';
import 'package:domain/use_cases/repository/network_repository.dart';

class PalindromeCaseImpl extends PalindromeCase<String, Future<bool>> {
  final INetworkRepository _repository;

  PalindromeCaseImpl(this._repository);

  @override
  Future<bool> call(String text) async => _repository
      .checkPalindrome(text)
      .then((value) => value.isPalindrome ?? false);
}
