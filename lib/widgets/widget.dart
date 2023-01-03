import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Avatar extends StatelessWidget {
  final IconData logo;
  Avatar({Key? key, required this.logo});
  @override
  Widget build(BuildContext context) {
    return _buildAvatar(this.logo);
  }
}

Widget _buildAvatar(IconData logo) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      CircleAvatar(
        radius: 25,
        // backgroundColor: Colors.grey,
        child: IconButton(
          // back: Colors.grey,
          highlightColor: Colors.grey,
          onPressed: () {},
          icon: Align(widthFactor: 1.0,
          heightFactor: 1.0,
            child: FaIcon(logo)),
          style: IconButton.styleFrom(
              padding: const EdgeInsets.all(3),
              backgroundColor: Colors.grey,
              ),
        ),
      )
    ],
  );
}


class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  //  Avatar({Key? key, required this.logo});
  MessageTile({required this.message, required this.sendByMe});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: sendByMe ? 0 : 24,
          right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: sendByMe
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.only(
            top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe ? const BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23)
            ) :
            const BorderRadius.only(
        topLeft: Radius.circular(23),
          topRight: Radius.circular(23),
          bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sendByMe ? [
                const Color(0xff007EF4),
                const Color(0xff2A75BC)
              ]
                  : [
                const Color(0x1AFFFFFF),
                const Color(0x1AFFFFFF)
              ],
            )
        ),
        child: Text(message,
            textAlign: TextAlign.start,
            style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'OverpassRegular',
            fontWeight: FontWeight.w300)),
      ),
    );
  }
}
