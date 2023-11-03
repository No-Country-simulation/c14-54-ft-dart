import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/presentation/providers/chat_providers/chat_provider.dart';
import 'package:gestion_inventario/features/home/presentation/widgets/her_message.dart';
import 'package:gestion_inventario/features/home/presentation/widgets/message_field_box.dart';
import 'package:gestion_inventario/features/home/presentation/widgets/my_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/9613/9613450.png',
            ),
          ),
        ),
        title: const Text('Money Mentor🤖'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatFuntions = ref.watch(chatProvider.notifier);
    final chat = ref.watch(chatProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatFuntions.chatScrollController,
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  final Message message = chat[index];
                  return chat[index].fromWho == FromWho.mine
                      ? MyMessageBubble(
                          message: message.text,
                        )
                      : HerMessage(
                          message: message,
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: MessageFieldBox(
                onValue: (value) async {
                  await ref.read(chatProvider.notifier).sendMessage(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
