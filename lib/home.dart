import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_unfocus_text_field/main.dart';
import 'package:test_unfocus_text_field/my_money.dart';
import 'package:test_unfocus_text_field/my_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget spacer = const SizedBox(height: 16);
  TextStyle textStyle = const TextStyle(fontSize: 30);
  late TextEditingController controller;
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(decimalDigits: 2, locale: 'ko', symbol: '');

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Listener(
        onPointerDown: (event) {
          if (MyMoney.justClicked) {
            //do nothing
            MyMoney.justClicked = false;
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Cái này là Text nè',
                  style: textStyle,
                ),
                spacer,
                MyButton(
                    text: 'Button nè ^^',
                    onTap: () {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Mới nhấp dô cái nút nè'),
                          duration: Duration(seconds: 1),
                        ));
                      });
                    }),
                spacer,
                MyMoney(hint: 'Money Field 1'),
                spacer,
                MyMoney(hint: 'Money Field 2'),
                spacer,
                MyTextField(hint: 'Another text field 1'),
                spacer,
                MyTextField(hint: 'Another text field 2'),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
