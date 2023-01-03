import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/login_page.dart';
import '../widgets/widget.dart';

//message class definition
class Message {
  String? id;
  final String message;
  String user;
  final sentTime = DateTime.now().toLocal();

  Message({
    this.id,
    required this.message,
    required this.user,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'message': message, 'user': user, 'sentTime': sentTime};

  static Message fromJson(Map<String, dynamic> json) => Message(
        id: json['id'],
        message: json['message'],
        user: json['user'],
      );
}

//chat components
class Chat extends StatefulWidget {
  final String? whichChat;
  Chat({super.key, required this.whichChat});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _message = TextEditingController();
  String? userName = UserName.getString();

  // building the message with the help of the data got from the server
  Widget buildMessage(Message message) {
    String user = message.user;
    return MessageTile(
        message: message.message, sendByMe: user == userName ? true : false);
  }

  // reading the message with the help of the data got from the server
  Stream<List<Message>> readMessage() => FirebaseFirestore.instance
      .collection(widget.whichChat!)
      .orderBy('sentTime')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList());

  Future createMessage(Message message) async {
    final docUser = FirebaseFirestore.instance.collection('chat').doc();
    message.id = docUser.id;
    final json = message.toJson();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 330,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 330,
              height: 60,
              padding: const EdgeInsets.all(10),
              color: Colors.black,
              child: const Text(
                'Channel Name',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
                width: 330,
                height: 730,
                child: StreamBuilder<List<Message>>(
                  stream: readMessage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final messages = snapshot.data!;
                      return ListView(
                        children: messages.map(buildMessage).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: TextField(
                  controller: _message,
                  decoration: const InputDecoration(
                    focusColor: Colors.grey,
                    hintText: 'message..',
                  ),
                )),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    final message = Message(
                      message: _message.text,
                      user: userName.toString(),
                    );
                    createMessage(message);
                    setState(() {
                      _message.text = '';
                    });
                  },
                  icon: const FaIcon(FontAwesomeIcons.paperPlane),
                  label: const Text(''),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
