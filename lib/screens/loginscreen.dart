//TODO 10a: Also import auth services
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:meet_app_1/custom_button.dart';
import 'package:meet_app_1/google_signin_button.dart';
import 'package:meet_app_1/services/auth_services.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'guest_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TODO 11: create instance of auth service
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Meet App',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 30,),
              Image(image: AssetImage('assets/4911324.jpg')),
              SizedBox(height: 60,),
              Expanded(child: Container(height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.orange.shade700,
                        Colors.orange.shade600,
                        Colors.orange.shade500,
                        Colors.orange.shade400,
                        Colors.orange.shade700,],
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: Padding(padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text('Welcome, Get started',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                      SizedBox(height: 20,),
                      CustomButton(buttonText: 'Join as Guest', onTap: () =>
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => GuestPage()))),
                      const SizedBox(height: 30,),
                      CustomButton(buttonText: 'Sign in', onTap: () =>
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => GuestPage())),),
                      const SizedBox(height: 30,),
                      GoogleButton(onTap: () async {
                        await authServices.signInWithGoogle(context);
                      }),
                    ],
                  ),),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
