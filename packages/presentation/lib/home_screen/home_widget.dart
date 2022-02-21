import 'package:domain/use_cases/impl/palindrome_impl.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final palindromeCaseImpl = PalindromeCaseImpl();
  String textResult = "";
  String myText = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        TextField(
            onChanged: (text) {
              myText = text.toString();
            },
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Введите строку",
                fillColor: Colors.black12,
                filled: true)),
        ElevatedButton(
          onPressed: () {
            setState(() {
              final result = palindromeCaseImpl.isPalindrome(myText);
              myText = myText.trim();
              if (result) {
                textResult = "Это палиндром";
              } else {
                textResult = "Это не палиндром";
              }
            });
          },
          child: const Text("Проверить строку"),
        ),
        Text(textResult)
      ]),
      appBar: AppBar(title: const Text("Palindrome")),
    ));
  }
}
