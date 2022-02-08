import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ryuk_chat/screens/search/search_screen.dart';

class HomeChatScreen extends StatefulWidget {
  static const String id = "home_chat_screen";

  @override
  _HomeChatScreenState createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/236x/dc/51/7e/dc517eeda525992166ddc5b9eb566aac.jpg"))),
        ),
        title: Text("Chat"),
        actions: [
          Icon(Icons.more_horiz),
          SizedBox(
            width: 5.0,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(SearchScreen.id);
              },
              child: Container(
                height: 40.0,
                width: double.infinity,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    SizedBox(width: 10.0),
                    Icon(Icons.search),
                    Text("Search")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("go to chat screen");
              },
              child: Container(
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      foregroundImage: NetworkImage(
                        "https://scr.vn/wp-content/uploads/2020/07/H%C3%ACnh-m%C3%A8o-c%E1%BB%B1c-cute.jpg",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500),
                                      text: "Phan Thi Thanh Uyen"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text("10/07/2021"),
                              ),
                            ],
                          ),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                style: TextStyle(color: Colors.grey),
                                text:
                                    "the last message you or friend send,the last message you or friend send,the last message you or friend send,"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
