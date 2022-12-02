import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_unfocus_text_field/dismiss_keyboard.dart';
import 'package:test_unfocus_text_field/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Widget spacer = const SizedBox(height: 16);
  TextStyle textStyle = const TextStyle(fontSize: 30);
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(decimalDigits: 2);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        title: 'Test unfocus',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          color: Colors.blue,
          child: Text(
            text,
            style: const TextStyle(fontSize: 30).copyWith(color: Colors.white),
          )),
    );
  }
}
