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
