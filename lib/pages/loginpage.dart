
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../controller/googlesignincontroller.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: 
              [
                Text("Chat App", style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),
                ),

                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your e-mail id'
                  ),
                ),

                const SizedBox(height: 15,),

                const TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'Enter Password here',
                    labelText: "Password"),
                ),

                const SizedBox(height: 40,),

                CupertinoButton(
                  child: const Text('Login'), 
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {}
                  ),

                const SizedBox(height: 20,),

                const Text('OR'),
                
                const SizedBox(height: 20,),

                loginUI(),

              ]),
            ),
          ),
        ),
      ),
      
    );
  }


loginUI(){
    return Consumer<GoogleSignInController>(
      builder: (context, model, child){
        if(model.googleAccount !=null){
          return Center(child: loggedInUI(model),);
        }
        else
        {
          return loginControls(context);
        }
      },
      );
  }

  loggedInUI(GoogleSignInController model){
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.googleAccount!.photoUrl??'').image,
          radius:  50,
        ),
        Text(model.googleAccount!.displayName?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
          avatar: const Icon(Icons.logout),
          label: const Text('Logout'), 
          onPressed: (){
            Provider.of<GoogleSignInController>(context, listen: false).logout();
          }
          )
    ]
    );
  }

  loginControls(BuildContext context){
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('asset/images/google.png',
            width: 250,
            ),
            onTap: (){
              Provider.of<GoogleSignInController>(context, listen: false).login();
            },
          ),
        ],
      ) ,
    );
  }
 }