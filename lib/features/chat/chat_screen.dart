import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_in_app/features/chat/widgets/chat_bubble.dart';
import 'package:talk_in_app/models/message.dart';

class ChatScreen extends StatelessWidget {
  final String email;
  ScrollController scrollController = ScrollController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  ChatScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    //var email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt' , descending: true).snapshots(),
        builder: (context, snapshot) {
          snapshot.data;
          if (snapshot.hasData)
            {
              List <Message> messagesList = [];
              for (int i = 0 ; i < snapshot.data!.docs.length ; i++)
                {
                  messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
                }
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Talk In App',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email ? ChatBubbles(
                            message: messagesList[index],
                          ) : ChatBubblesForFriend(message: messagesList[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add({
                            'message' : data,
                            'createdAt' : DateTime.now(),
                            'id' : email,
                          });
                          controller.clear();
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.send,
                              color: Color(0xff2B475E),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16,),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16,),
                            borderSide: BorderSide(
                              color: Color(0xff2B475E),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
    );
  }
}

