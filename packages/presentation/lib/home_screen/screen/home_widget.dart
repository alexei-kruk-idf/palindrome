import 'package:domain/use_cases/impl/palindrome_impl.dart';
import 'package:flutter/material.dart';
import 'package:presentation/home_screen/bloc/palindrome_bloc.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final palindromeBlock = PalindromeBlock(PalindromeCaseImpl());
  String textResult = "";
  String myText = "";

  void _checkPalindrome() {
    palindromeBlock.inputStreamSink.add(myText);
  }

  void _onChangedText(String text) {
    myText = text;
  }

  @override
  void dispose() {
    palindromeBlock.dispose();
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
            stream: palindromeBlock.outputStreamSink,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Text(snapshot.data as String);
              } else {
                return Text('');
              }
            })
      ]),
      appBar: AppBar(title: const Text("Palindrome")),
    ));
  }
}
