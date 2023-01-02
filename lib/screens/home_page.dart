import 'package:chatroom_app/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          SizedBox(
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
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                    return const Text('hii');
                  }),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: const Expanded(child: TextField(
                        decoration: InputDecoration(
                          focusColor: Colors.grey,
                          hintText: 'message..',
                        ),
                      )),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(
                          
                        )
                      ),
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.paperPlane),
                      label: const Text(''),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
