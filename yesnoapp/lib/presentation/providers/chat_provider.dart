

import 'package:flutter/material.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'Hello, how are you?', fromWho: FromWho.hers),
  ]; 

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    messages.add(Message(text: text, fromWho: FromWho.mine));
    notifyListeners();
    moveScrollToBotton();
  }

  void moveScrollToBotton() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

