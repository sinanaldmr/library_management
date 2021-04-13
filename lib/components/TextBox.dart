import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({@required this.labelText, @required this.inputType, @required this.autoFocus});
  final String labelText;
  final TextInputType inputType;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labelText, border: OutlineInputBorder()),
        minLines: 1,
        keyboardType: inputType,
        autofocus: autoFocus,
      ),
    );
  }
}