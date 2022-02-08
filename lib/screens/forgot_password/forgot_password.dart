import 'package:flutter/material.dart';
import 'package:ryuk_chat/components/auth_navigate.dart';
import 'package:ryuk_chat/components/reusable_button.dart';
import 'package:ryuk_chat/components/reusable_textfield.dart';
import 'package:ryuk_chat/screens/sign_in/sign_in_screen.dart';
import 'package:ryuk_chat/ultis/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ryuk_chat/ultis/validation/email_validation.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = "forgot_password";

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  bool isValidEmail = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // click outside to hide keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 10.0),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText("Ryuk Chat",textStyle: kAppTitle)
                ],
                repeatForever: true,
              ),
              SizedBox(height: 10.0),
              ReusableTextField(
                obscureText: false,
                hintText: "Please enter your email",
                controller: emailController,
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                errorText: isValidEmail ? null : "Please enter a valid email!",
              ),
              SizedBox(height: 10.0),
              ReusableButton(
                title: "Send",
                color: Colors.greenAccent,
                function: () {
                  print("send email");
                  bool emailValidate = EmailValidation(emailController.text).isValidEmail();
                  setState(() {
                    isValidEmail = emailValidate;
                  });
                },
              ),
              SizedBox(height: 10.0),
              AuthNavigate(
                titleButton: "Login",
                titleNavigate: "Go back to login ?",
                function: (){
                  Navigator.of(context).popUntil(ModalRoute.withName(SignInScreen.id));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
