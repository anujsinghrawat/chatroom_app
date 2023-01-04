import 'package:chatroom_app/components/chat.dart';
import 'package:chatroom_app/screens/login_page.dart';
import 'package:chatroom_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  String whichChat;
  Home({super.key,required this.whichChat});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  Avatar(logo: FontAwesomeIcons.futbol,route: '/home',channel: 'Football Channel', ),
                  Avatar(logo: FontAwesomeIcons.code,route: '/home/code',channel: 'Code Channel',),
                  Avatar(logo: FontAwesomeIcons.camera,route: '/home/photo',channel: 'Photography Club',),
                  Avatar(logo: FontAwesomeIcons.gamepad ,route: '/home/game',channel: 'Gaming Channel ',),
                  Avatar(logo: FontAwesomeIcons.palette,route: '/home/art',channel: 'Arts & Painting', ),
                ],
              ),
            ),
          ),
          Chat(whichChat: widget.whichChat,),
        ],
      )),
    );
  }
}
