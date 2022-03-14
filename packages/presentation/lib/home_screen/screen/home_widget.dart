import 'package:data/dio/dio_builder.dart';
import 'package:data/helper/api_path.dart';
import 'package:data/repository/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/use_cases/impl/palindrome_impl.dart';
import 'package:flutter/material.dart';
import 'package:presentation/home_screen/bloc/base/bloc_data.dart';
import 'package:presentation/home_screen/bloc/home_bloc.dart';
import 'package:presentation/home_screen/bloc/home_data.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late final Dio _dio = dioBuilder(ApiPath.getBaseUrlPalindrome());
  late final ApiService _apiService = ApiService(
    _dio,
  );
  late final CancelToken _cancelToken = CancelToken();
  late final NetworkRepository _palindromeRepository =
      NetworkRepository(_apiService, _cancelToken);
  late final HomeBloc _homeBloc =
      HomeBloc(PalindromeCaseImpl(_palindromeRepository));

  String textResult = "";
  String myText = "";

  void _checkPalindrome() {
    _homeBloc.checkPalindrome();
  }

  void _onChangedText(String text) {
    _homeBloc.textPalindrome = text;
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        TextField(
            onChanged: _onChangedText,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Введите строку",
                fillColor: Colors.black12,
                filled: true)),
        ElevatedButton(
          onPressed: _checkPalindrome,
          child: const Text("Проверить строку"),
        ),
        StreamBuilder(
            stream: _homeBloc.dataStream,
            initialData: BlocData.init(),
            builder: (context, snapshot) {
              final screenData = snapshot.data;
              if (screenData is BlocData) {
                if (screenData.isLoading) {
                  return const CircularProgressIndicator();
                } else if (screenData.data is HomeData) {
                  return Text(screenData.data.isPalindrome
                      ? 'Это палиндром'
                      : 'Это не палиндром');
                } else {
                  return const Text('');
                }
              } else {
                return const Text('');
              }
            })
      ]),
      appBar: AppBar(title: const Text("Palindrome")),
    ));
  }
}
