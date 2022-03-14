abstract class ApiPath {
  static String getBaseUrlPalindrome() {
    return 'https://fpwebservice.herokuapp.com';
  }

  static String getPathUrlPalindrome(String text) {
    return '/ispalindrome/$text';
  }
}
