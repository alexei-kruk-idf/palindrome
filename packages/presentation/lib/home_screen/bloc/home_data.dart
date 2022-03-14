class HomeData {
  bool isPalindrome;
  String textPalindrome;

  HomeData(this.isPalindrome, this.textPalindrome);

  factory HomeData.init() => HomeData(false, '');

  HomeData copy() => HomeData(isPalindrome, textPalindrome);
}
