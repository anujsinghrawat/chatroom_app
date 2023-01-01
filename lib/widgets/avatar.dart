import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Avatar extends StatelessWidget {
  final String name;
  Avatar({Key? key, required this.name});
  @override
  Widget build(BuildContext context) {
    return _buildAvatar(this.name);
  }
}

Widget _buildAvatar(String name) {
  return Column(
    children: [
      SizedBox(height: 20,),
      // ElevatedButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.${name}), label: Text(' '))
    ],
  );
}
