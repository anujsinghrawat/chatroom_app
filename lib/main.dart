import 'package:chatroom_app/screens/home_page.dart';
import 'package:chatroom_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/splash': (context) => LoginPage(),
        '/home': (context) => Home(whichChat: 'chat',),
        '/home/code': (context) => Home(whichChat: 'code',),
        '/home/photo': (context) => Home(whichChat: 'photography',),
        '/home/game': (context) => Home(whichChat: 'gaming',),
        '/home/art': (context) => Home(whichChat: 'arts',),


      },


    );
  }
}
