import 'package:domain/use_cases/impl/palindrome_impl.dart';
import 'package:presentation/home_screen/bloc/base/base_bloc.dart';
import 'package:presentation/home_screen/bloc/home_data.dart';

abstract class HomeBloc extends BaseBloc<HomeData> {
  factory HomeBloc(
    PalindromeCaseImpl palindromeUseCase,
  ) =>
      _HomeBloc(palindromeUseCase);

  void checkPalindrome();

  set textPalindrome(String text);
}

class _HomeBloc extends BaseBlocIml<HomeData> implements HomeBloc {
  final PalindromeCaseImpl _palindromeUseCase;
  final _screenData = HomeData.init();
  bool _isLoading = false;

  @override
  set textPalindrome(String text) => _screenData.textPalindrome = text;

  _HomeBloc(this._palindromeUseCase);

  @override
  void checkPalindrome() async {
    _isLoading = true;
    updateData();
    _screenData.isPalindrome =
        await _palindromeUseCase(_screenData.textPalindrome);
    _isLoading = false;
    updateData();
  }

  void updateData() {
    handleData(isLoading: _isLoading, data: _screenData);
  }
}
