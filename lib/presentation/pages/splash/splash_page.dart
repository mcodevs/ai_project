import 'dart:math';

import 'package:ai_project/infrastructure/db/db.dart';
import 'package:ai_project/infrastructure/models/chat/chat_model.dart';
import 'package:ai_project/infrastructure/models/chats_view/chats_view_model.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ValueNotifier<List<ChatsViewModel>> version = ValueNotifier([]);

  @override
  void initState() {
    getChats();
    super.initState();
  }

  void getChats() async {
    version.value = await context.read<DB>().getChats();
  }

  // Future<void> _getVersion() async {
  //   PackageInfo.fromPlatform().then(
  //     (value) {
  //       version.value = value.version;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final ChatsViewModel newChat = ChatsViewModel(
              topic: 'lalala',
              createdAt: DateTime.now(),
            );
            await context.read<DB>().addToChats(newChat);
          },
        ),
      ),
      body: Center(
        child: ValueListenableBuilder(
          builder: (context, data, _) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final chatView = data.elementAt(index);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MessagesPage(
                          id: chatView.id,
                        ),
                      ),
                    );
                  },
                  title: Text(chatView.topic),
                  subtitle: Text(chatView.createdAt.toIso8601String()),
                );
              },
            );
          },
          valueListenable: version,
        ),
      ),
    );
  }
}

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key, required this.id});
  final String id;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final ValueNotifier<List<ChatModel>> messages = ValueNotifier([]);

  Future<void> getMessages() async {
    messages.value = await context.read<MessagesDB>().getMessages(widget.id);
  }

  @override
  void initState() {
    getMessages();
    super.initState();
  }

  static final _rand = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final ChatModel message = ChatModel(
            chatId: widget.id,
            text: nouns.elementAt(_rand.nextInt(nouns.length)),
            role: _rand.nextBool() ? Role.model : Role.user,
          );
          await context.read<MessagesDB>().addToMessages(message);
          await getMessages();
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: messages,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final message = value.elementAt(index);
              return ListTile(
                title: Row(
                  mainAxisAlignment: switch (message.role) {
                    Role.user => MainAxisAlignment.end,
                    Role.model => MainAxisAlignment.start,
                  },
                  children: [
                    Text(message.text),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
