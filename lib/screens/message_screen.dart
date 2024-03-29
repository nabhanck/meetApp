// ignore_for_file: prefer_const_constructors

//TODO 29: Import cloud firestore, firebase auth, intl, scaffold gradient and database services
import 'package:flutter/material.dart';
import 'package:meet_app_1/services/database_services.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {Key? key,
        required this.id,
        required this.groupName,
        required this.color,
        required this.overall})
      : super(key: key);
  final String id;
  final String groupName;
  final Color color;
  final double overall;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  //Declaring the scroll controller for auto scroll messages
  late ScrollController _scrollController;
  //TODO 30: Create instances of Firebase auth, firebase firestore, text editing controller and database services
  DataBaseServices dataBaseServices = DataBaseServices();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //Disposing the scroll controller
    _scrollController.dispose();
    //TODO 31: dispose of the text editing controller
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    //Initializing scroll controller with initial scroll position set to screen height
    //So scroll controller comes to the end of the message list whenever the message screen is opened
    _scrollController = ScrollController(initialScrollOffset: h);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                w * 0.05,
              ),
              bottomRight: Radius.circular(
                w * 0.05,
              ),
            ),
          ),
          toolbarHeight: h * 0.1,
          backgroundColor: Colors.orange.shade400,
          leading: Container(
            margin: EdgeInsets.only(
              left: w * 0.05,
            ),
            child: CircleAvatar(
              radius: w * 0.6,
              backgroundColor: widget.color,
              child: Text(
                widget.groupName.substring(0, 1),
                style: TextStyle(
                  color: widget.overall > 127.5 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: w * 0.06,
                ),
              ),
            ),
          ),
          title: Text(
            widget.groupName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: w * 0.07,
              fontWeight: FontWeight.w500,
            ),
          ),
          leadingWidth: 60,
        ),
        body:
        //TODO 32a: specify type of stream as QuerySnapshot
        StreamBuilder<QuerySnapshot>(

          //TODO 32b: Provide messages stream ordered by 'Time' parameter. This avoids the error in the line 'snapshot.data!.docs' getter
            stream: firebaseFirestore
                .collection('chats')
                .doc(widget.id)
                .collection('messages')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Unable to load messages',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: w * 0.08,
                          color: Color(0xff37007C).withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasData &&
                 snapshot.data!.docs.isNotEmpty) {
                //TODO 33a: Create messages List<DocumentSnapshot>
                List? messages = snapshot.data!.docs;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: w * 0.015,
                          right: w * 0.015,
                          top: h * 0.015,
                        ),
                        child: ListView.separated(

                          //Setting list view controller to scroll controller
                          controller: _scrollController,

                          itemBuilder: (context, index) {
                            //TODO 37: Return Message Bubble widget with username, message, current user or not, and photo url instead of Container
                            return MessageBubble(username: messages![index]['Username'], message: messages[index]['Message'], dpURL: messages[index]['Profile pic'],
                                isMe: firebaseAuth.currentUser?.email==messages[index]['E-mail']);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          //TODO 33b: provide messages List<DocumentSnapshot> length instead of number 10
                          itemCount: messages!.length,
                        ),
                      ),
                    ),
                    Container(
                      // width: w * 0.7,
                      margin: EdgeInsets.only(
                        left: w * 0.04,
                        right: w * 0.04,
                        bottom: h * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            w * 0.03,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: w * 0.03,
                              right: w * 0.01,
                            ),
                            width: w * 0.75,
                            child: TextFormField(
                              //TODO 34: set controller
                              controller: messageController,
                              cursorColor: Color(0xffcc7b01),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: w * 0.045,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type message...',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: w * 0.045,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async
                            {
                              //TODO 35: Get message and write to database using database services
                              await dataBaseServices.addMessage(
                                  widget.id,
                                  messageController.text,
                                  DateFormat('yyyy MM dd, hh:mm:ss a MMM E').format(DateTime.now()),
                                widget.groupName
                              );
                              //Function to auto scroll to the end as messages are added
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(
                                  milliseconds: 200,
                                ),
                                curve: Curves.easeIn,
                              );

                              //TODO 36: clear controller
                              messageController.clear();
                            },
                            icon: Icon(
                              Icons.send_rounded,
                              size: w * 0.08,
                              color: Color(0xffffe4c9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasData
                  && snapshot.data!.docs.isEmpty
              ) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        'Start a conversation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: w * 0.08,
                          color: Color(0xffcc7b01).withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: w * 0.04,
                          right: w * 0.04,
                          bottom: h * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              w * 0.03,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: w * 0.03,
                                right: w * 0.01,
                              ),
                              width: w * 0.75,
                              child: TextFormField(
                                //TODO 38: set same controller used when snapshot data is not empty
                                controller: messageController,
                                cursorColor: Color(0xff37007C),
                                style: TextStyle(
                                  color: Color(0xff37007C),
                                  fontSize: w * 0.045,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type message...',
                                  hintStyle: TextStyle(
                                    color: Color(0xffF3C9FF),
                                    fontSize: w * 0.045,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                //TODO 39: Write data to database using database services and clear controller
                                await dataBaseServices.addMessage(
                                widget.id,
                                messageController.text,
                                DateFormat('yyyy MM dd, hh:mm:ss a MMM E').format(DateTime.now()),
                                widget.groupName,
                                );
                                messageController.clear();
                              },
                              icon: Icon(
                                Icons.send_rounded,
                                size: w * 0.08,
                                color: Color(0xff37007C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff650088),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String? username;
  final String message;
  final String? dpURL;
  final bool isMe;
  const MessageBubble({
    Key? key,
    required this.username,
    required this.message,
    required this.dpURL,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            minWidth: w * 0.01,
            maxWidth: w * 0.5,
          ),
          padding: EdgeInsets.only(
            left: isMe ? w * 0.03 : w * 0.02,
            right: isMe ? w * 0.02 : w * 0.03,
            top: h * 0.005,
            bottom: h * 0.01,
          ),
          decoration: BoxDecoration(
            color: isMe ? Colors.orange.shade900 : Colors.orange.shade100,
            borderRadius: isMe
                ? BorderRadius.only(
              bottomLeft: Radius.circular(
                w * 0.05,
              ),
            )
                : BorderRadius.only(
              bottomRight: Radius.circular(
                w * 0.05,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: w * 0.03,
                    backgroundImage: NetworkImage(dpURL!),
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Flexible(
                    child: Text(
                      isMe? 'You' : username!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: isMe ? Color(0xffF8E5FF) : Color(0xff650088),
                        fontWeight: FontWeight.w600,
                        fontSize: w * 0.05,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.012,
              ),
              Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Color(0xff650088),
                  fontWeight: FontWeight.w400,
                  fontSize: w * 0.04,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

