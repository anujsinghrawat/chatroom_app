import 'package:chatroom_app/screens/login_page.dart';
import 'package:chatroom_app/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _message = TextEditingController();
  String? userName = UserName.getString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Container(
            color: Colors.black,
            child: SizedBox(
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Avatar(logo: FontAwesomeIcons.futbol),
                  Avatar(logo: FontAwesomeIcons.code),
                  Avatar(logo: FontAwesomeIcons.camera),
                  Avatar(logo: FontAwesomeIcons.gamepad),
                  Avatar(logo: FontAwesomeIcons.palette),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
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
                      // child: ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: 10,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return const Text('hii');
                      //     }),

                      child: StreamBuilder<List<Message>>(
                        stream: readMessage(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final messages = snapshot.data!;
                            return ListView(
                              children: messages.map(buildMessage).toList(),
                            );
                          } else {
                            return Center(
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
                          // sentTime: DateTime.now().toLocal(););
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
          )
        ],
      )),
    );
  }

  // Widget buildMessage(Message message) => ListTile(
  //       title: Text(message.message),
  //     );

  Widget buildMessage(Message message) {
    String user= message.user;
    return MessageTile(message: message.message, sendByMe: user==userName?true:false);
  }

  Stream<List<Message>> readMessage() => FirebaseFirestore.instance
      .collection('chat')
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
}

class Message {
  String? id;
  final String message;
  String user;
  final sentTime = DateTime.now().toLocal();

  Message({
    this.id,
    required this.message,
    required this.user,
    // required this.sentTime,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'message': message, 'user': user, 'sentTime': sentTime};

  static Message fromJson(Map<String, dynamic> json) => Message(
        id: json['id'],
        message: json['message'],
        user: json['user'],
      );
}
