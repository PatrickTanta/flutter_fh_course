

import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/get_yes_no_answer.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hello, how are you?', fromWho: FromWho.hers),
  ]; 

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

  if (text.trim().endsWith('?')) {
      await herReply();
  }
    
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
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
