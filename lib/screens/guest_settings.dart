import 'package:flutter/material.dart';

class GuestSettingsPage extends StatelessWidget {
  const GuestSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Icon(Icons.account_circle,size: 100,),
            SizedBox(height: 20,),
            Text('Guest Settings',style: TextStyle(fontSize: 20),),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){},
              child: SizedBox(width: 400,height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text('data')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
              child: SizedBox(width: 400,height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text('Account')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
              child: SizedBox(width: 400,height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text('Accessibility')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
              child: SizedBox(width: 400,height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text('Privacy and security')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
              child: SizedBox(width: 400,height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text('About')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
              child: SizedBox(width: 400,height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text('Sign out')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
