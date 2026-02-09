import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoapp/domain/entities/message.dart';
import 'package:yesnoapp/presentation/providers/chat_provider.dart';
import 'package:yesnoapp/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yesnoapp/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesnoapp/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqlcFvGmZY1rZ14qb5IibcXwupgBl_w55pMPE_26bqvsuIzzG_g3qgr5Owj0RVNW7XgULdGPZax7Ju7PU0nkgj3Nr0ULOHE0toDj9GKQ&s=10'),
          ),
        ),
        title: Text('Lionel Messi'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
                return (message.fromWho == FromWho.hers) ?
                 HerMessageBubble(message: message) : MyMessageBubble(message: message);
              },
            )),
            MessageFieldBox(onValue: (value) {
              chatProvider.sendMessage(value);
            }),
          ],
        ),
      ),
    );
  }
}
