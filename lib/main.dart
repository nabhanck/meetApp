// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';

import 'package:meet_app_1/services/auth_services.dart';

import 'screens/loginscreen.dart';
import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';
//TODO 1: import firebase core and auth packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/message_screen.dart';



Future<void> main() async{
  //TODO 3: Initialise widgets and firebase app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FirstScreen());
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  AuthServices authServices = AuthServices();
  User? currentUser;

  //TODO 4: create a Firebase User
  @override
  void initState() {
    // TODO 5: initialise the User
    super.initState();
    currentUser = authServices.firebaseAuth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xffCA26FF),
          colorScheme: ColorScheme.fromSwatch(
              primaryColorDark: Color(0xffFFF3B0),
              accentColor: Color(0xff37007C))),
      debugShowCheckedModeBanner: false,
      initialRoute:'login',
      routes: {
        'login': (context) => LoginScreen(),
        'Welcome': (context) => WelcomeScreen(),
      },
    );
  }
}

