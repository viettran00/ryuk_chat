import 'package:flutter/material.dart';
import 'package:ryuk_chat/components/auth_navigate.dart';
import 'package:ryuk_chat/components/reusable_button.dart';
import 'package:ryuk_chat/components/reusable_textfield.dart';
import 'package:ryuk_chat/screens/forgot_password/forgot_password.dart';
import 'package:ryuk_chat/screens/home_chat/home_chat_screen.dart';
import 'package:ryuk_chat/screens/sign_up/sign_up_screen.dart';
import 'package:ryuk_chat/ultis/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ryuk_chat/ultis/validation/email_validation.dart';
import 'package:ryuk_chat/ultis/validation/password_validation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "sign_in_screen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;
  bool isValidEmail = true;
  bool isValidPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // click outside to hide keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: WillPopScope(
        onWillPop: () => onWillPop(),
        child: Scaffold(
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: 100.0,
                ),
                SizedBox(height: 10.0),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText("Ryuk Chat", textStyle: kAppTitle)
                  ],
                  repeatForever: true,
                ),
                SizedBox(height: 10.0),
                ReusableTextField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: "Please enter your email",
                  textInputAction: TextInputAction.next,
                  icon: Icons.email,
                  errorText: isValidEmail ? null : "Please enter a valid email",
                ),
                SizedBox(height: 10.0),
                Stack(
                  children: [
                    ReusableTextField(
                      obscureText: isObscure,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      hintText: "Please enter your password",
                      textInputAction: TextInputAction.done,
                      icon: Icons.lock,
                      errorText:
                          isValidPassword ? null : "Invalid password format",
                    ),
                    Positioned(
                      right: 15.0,
                      top: 18.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(ForgotPassword.id);
                      },
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                ReusableButton(
                  title: "Login",
                  color: Colors.blue,
                  function: () {

                    Navigator.of(context).pushNamed(HomeChatScreen.id);

                    bool emailValidate =
                        EmailValidation(emailController.text).isValidEmail();
                    bool passwordValidate =
                        PasswordValidation(passwordController.text)
                            .isValidPassword();

                    setState(() {
                      isValidEmail = emailValidate;
                      isValidPassword = passwordValidate;
                    });
                    // hide keyboard
                    FocusScope.of(context).requestFocus(new FocusNode());

                    // show snack bar
                    isValidPassword ? SizedBox():
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 8),
                        content: Text(
                            "password must be at least 8 characters including a number an uppercase letter and a lowercase letter"),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                AuthNavigate(
                  titleNavigate: 'Don\'t have an account?',
                  function: () {
                    Navigator.of(context).pushNamed(SignUpScreen.id);
                  },
                  titleButton: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

DateTime? currentBackPressTime;
Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    Fluttertoast.showToast(msg: "Press back again to exit");
    return Future.value(false);
  }
  return Future.value(true);
}
