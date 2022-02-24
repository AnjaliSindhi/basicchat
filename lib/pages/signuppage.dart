import 'dart:html';

import 'package:basicchat/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

    void signup(String email, String password) async{
        UserCredential? credential;

        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);

          if(credential != null){
            String  uid =  credential.user!.uid;
            UserModel newUser = UserModel(
              uid: uid,
              email: email,
              fullname: "",
              profilepic: "",
            );
            await  FirebaseFirestore.instance.collection("users").doc(uid).set
            (newUser.toMap()).then((value) {
              print("new User Created");
            });
          }
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}