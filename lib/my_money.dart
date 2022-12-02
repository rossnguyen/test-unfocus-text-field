import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMoney extends StatefulWidget {
  const MyMoney({super.key, required this.hint});
  // static bool justClicked = false;
  final String hint;

  @override
  State<MyMoney> createState() => _MyMoneyState();
}

class _MyMoneyState extends State<MyMoney> {
  late TextEditingController controller;

  TextStyle textStyle = const TextStyle(fontSize: 30);
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
    return TextFormField(
      controller: controller,
      style: textStyle,
      inputFormatters: <TextInputFormatter>[_formatter],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: widget.hint),
    );
  }
}
