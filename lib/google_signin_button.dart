import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class GoogleButton extends StatelessWidget {
  GoogleButton({super.key, required this.onTap});

  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.orange.shade900,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(children: [
            Icon(FontAwesomeIcons.google,color: Colors.white,),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text('Google Signin',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
            ),
          ],)
      ),
    );
  }
}
