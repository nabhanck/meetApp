import 'package:flutter/material.dart';


import 'guest_signedin.dart';

class GuestPage extends StatelessWidget {
  TextEditingController _name = new TextEditingController();
  GuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _name,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: Colors.black),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'Guest Name',
                  prefixIcon: Icon(Icons.password_sharp)
              ),
            ),
          ),
          Text('To join a meeting as guest, Enter meeting ID'),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(width: double.infinity,height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shadowColor: Colors.yellow,backgroundColor: Colors.orange.shade900,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GuestSignedin(name: _name.text)));
                },
                child: Text('Join',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
