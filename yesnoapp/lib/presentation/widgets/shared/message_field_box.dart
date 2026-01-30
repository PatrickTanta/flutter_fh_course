import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final void Function(String value) onValue;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        }, icon: Icon(Icons.send)),
      );

    return TextField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}