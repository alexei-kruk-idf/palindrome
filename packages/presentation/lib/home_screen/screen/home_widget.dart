import 'package:flutter/material.dart';
import 'package:presentation/home_screen/bloc/base/bloc_data.dart';
import 'package:presentation/home_screen/bloc/bloc_state.dart';
import 'package:presentation/home_screen/bloc/home_bloc.dart';
import 'package:presentation/home_screen/bloc/home_data.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends BlocState<HomeWidget, HomeBloc> {
  String textResult = "";
  String myText = "";

  void _checkPalindrome() {
    homeBloc.checkPalindrome();
  }

  void _onChangedText(String text) {
    homeBloc.textPalindrome = text;
  }

  @override
  void dispose() {
    homeBloc.dispose();
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
            stream: homeBloc.dataStream,
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
