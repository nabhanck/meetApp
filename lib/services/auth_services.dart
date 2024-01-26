
//TODO 6a: import firebase auth and google sign in packages

import 'package:flutter/material.dart'; //To invoke a snackbar
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//TODO 7: Create Auth Services class and write function to sign IN/Sign up using google account
class AuthServices {
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle(BuildContext context)async{
    try{
      GoogleSignInAccount? googleSignInAccounnt = await googleSignIn.signIn();
      if(googleSignInAccounnt!=null){
        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccounnt.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try{
          UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
          Navigator.pushNamedAndRemoveUntil(context, 'Welcome', (route) => false);
        }catch(e){
          final snackBar = SnackBar(content: Text(
            'Could not signin due to ($e)',
            style: TextStyle(
                color: Color(0xffFFF3B0),
                backgroundColor: Color(0xff37007C)
            ),
          )
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
      else{
        final snackBar = SnackBar(content: Text(
          'Could not signin ',
          style: TextStyle(
              color: Color(0xffffffff),
          ),
        )
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
        catch(e){
          final snackBar = SnackBar(content: Text(
            'Could not signin due to ($e)',
            style: TextStyle(
                color: Color(0xffFFF3B0),
                backgroundColor: Color(0xff37007C)
            ),
          )
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
  }

  Future<void> signOutoGoogle(BuildContext context)async{
    try{
      googleSignIn.signOut();
      firebaseAuth.signOut();
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    }
        catch(e){
          final snackBar = SnackBar(content: Text(
            'error occured due to ($e)',
            style: TextStyle(
                color: Color(0xffFFF3B0),
                backgroundColor: Color(0xff37007C)
            ),
          )
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
  }
}
