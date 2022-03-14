import 'dart:convert';

class PalindromeResponse {
  final bool? isPalindrome;
  PalindromeResponse(this.isPalindrome);

  static PalindromeResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return PalindromeResponse(jsonData['isPalindrome']);
  }
}
