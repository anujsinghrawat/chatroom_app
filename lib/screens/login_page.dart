import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final username = TextEditingController();
  late TextEditingController cont;
  @override
  void initState() {
    super.initState();
    cont = TextEditingController(text: 'anuj');
  }

  void continueNow() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "Create a username",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(),
                  textScaleFactor: 1.5,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  // controller: username,
                  controller: cont,
                  decoration: const InputDecoration(
                      focusColor: Colors.grey,
                      prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: FaIcon(FontAwesomeIcons.userAstronaut)),
                      fillColor: Colors.white,
                      hintText: 'username',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ))),
                ),
                const SizedBox(
                  // child: Text(),
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    // UserName.setString(username.text);
                    UserName.setString(cont.text);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('name', cont.text);
                    cont.text = prefs.getString('name')!;

                    Navigator.pushNamed(context, '/home');
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowRight, size: 12),
                  label: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    minimumSize: const Size(350, 50),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class UserName {
  static String? name;
  static void setString(String newValue) {
    name = newValue;
  }

  static String? getString() {
    return name;
  }
}
