import 'package:flutter/material.dart';
import 'package:meet_app_1/screens/loginscreen.dart';

import 'guest_settings.dart';

class GuestSignedin extends StatelessWidget {
  GuestSignedin({Key? key,required this.name}) : super(key: key);

  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GuestSettingsPage()));
          }, icon: Icon(Icons.manage_accounts))
        ],
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.account_circle,size: 100,),
            SizedBox(height: 20,),
            Text('${name}',style: TextStyle(fontSize: 25),),
            SizedBox(height: 20,),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1,color: Colors.black),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      labelText: 'Room Search',
                      suffixIcon: Icon(Icons.search)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(children: [
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                  child: SizedBox(width: 400,height: 130,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Text('Meeting_1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Room name: xyz',style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Creator: abc',style: TextStyle(fontSize: 20),),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 200.0),
                                    child: Icon(Icons.arrow_forward,size: 30,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Status: online',style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                  child: SizedBox(width: 400,height: 130,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Text('Meeting_2',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Room name: xyz',style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Creator: abc',style: TextStyle(fontSize: 20),),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 200.0),
                                    child: Icon(Icons.arrow_forward,size: 30,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Status: online',style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                  child: SizedBox(width: 400,height: 130,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Text('Meeting_1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Room name: xyz',style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Creator: abc',style: TextStyle(fontSize: 20),),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 200.0),
                                    child: Icon(Icons.arrow_forward,size: 30,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Text('Status: online',style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(onTap: (){},
                child: SizedBox(width: 300,height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text('Create new meeting',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
