import 'package:flutter/material.dart';
import 'package:meet_app_1/screens/guest_page.dart';


class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.buttonText,required this.onTap});

  VoidCallback onTap;
  String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.orange.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),),
      ),
    );
  }
}
