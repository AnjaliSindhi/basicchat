import 'package:basicchat/pages/homepage.dart';
import 'package:basicchat/pages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/googlesignincontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInController(),
          child: LoginPage() ,
          ),
    ],
    
    child:  MaterialApp(
      home:  LoginPage(),
      debugShowCheckedModeBanner: false,
    )
    );
  }
}