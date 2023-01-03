import 'package:chatroom_app/components/chat.dart';
import 'package:chatroom_app/screens/login_page.dart';
import 'package:chatroom_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userName = UserName.getString();
  String whichChat = 'code';

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
          Chat(whichChat: whichChat,),
        ],
      )),
    );
  }
}
