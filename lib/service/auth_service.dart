// ignore_for_file: unnecessary_null_comparison, unused_local_variable, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass{
// ignore: prefer_final_fields, unused_field
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

FirebaseAuth auth  = FirebaseAuth.instance;

Future<void> googleSignIn() async{
  try{
    GoogleSignInAccount googleSignInAccount = googleSignIn.signIn();
    if(googleSignInAccount != null){
      GoogleSignInAuthentication googleSignInAuthentication = 
              await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        try{
        UserCredential userCredential =  await auth.signInWithCredential(credential);
    }
    catch(e){}

  }
  }
  catch(e){
  }
}
}