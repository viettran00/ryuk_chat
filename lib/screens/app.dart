import 'package:flutter/material.dart';
import 'package:ryuk_chat/screens/forgot_password/forgot_password.dart';
import 'package:ryuk_chat/screens/home_chat/home_chat_screen.dart';
import 'package:ryuk_chat/screens/search/search_screen.dart';
import 'package:ryuk_chat/screens/sign_in/sign_in_screen.dart';
import 'package:ryuk_chat/screens/sign_up/sign_up_screen.dart';

class RyukChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignInScreen.id,
      routes: {
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ForgotPassword.id: (context) => ForgotPassword(),
        HomeChatScreen.id: (context) => HomeChatScreen(),
        SearchScreen.id: (context) => SearchScreen(),
      },
    );
  }
}
