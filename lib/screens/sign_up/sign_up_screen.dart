import 'package:flutter/material.dart';
import 'package:ryuk_chat/components/auth_navigate.dart';
import 'package:ryuk_chat/components/reusable_button.dart';
import 'package:ryuk_chat/components/reusable_textfield.dart';
import 'package:ryuk_chat/screens/sign_in/sign_in_screen.dart';
import 'package:ryuk_chat/ultis/validation/email_validation.dart';
import 'package:ryuk_chat/ultis/validation/password_validation.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "sign_up_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  bool isObscurePassword = true;
  bool isObscureRePassword = true;

  bool isValidEmail = true;
  bool isValidPassword = true;
  bool isValidRePassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // click outside to hide keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 100.0),
              Text("Register an account"),
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
                    obscureText: isObscurePassword,
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    hintText: "Please enter your password",
                    textInputAction: TextInputAction.next,
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
                          isObscurePassword = !isObscurePassword;
                        });
                      },
                      child: Icon(isObscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Stack(
                children: [
                  ReusableTextField(
                    obscureText: isObscureRePassword,
                    keyboardType: TextInputType.text,
                    controller: rePasswordController,
                    hintText: "Re-enter your password",
                    textInputAction: TextInputAction.done,
                    icon: Icons.lock,
                    errorText: isValidRePassword ? null : "Password not match",
                  ),
                  Positioned(
                    right: 15.0,
                    top: 18.0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureRePassword = !isObscureRePassword;
                        });
                      },
                      child: Icon(isObscureRePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              ReusableButton(
                title: "Sign Up",
                color: Colors.green,
                function: () {
                  print("on sign up");

                  bool emailValidate =
                      EmailValidation(emailController.text).isValidEmail();
                  bool passwordValidate =
                      PasswordValidation(passwordController.text)
                          .isValidPassword();

                  setState(() {
                    isValidEmail = emailValidate;
                    isValidPassword = passwordValidate;
                    if (isValidPassword) {
                      passwordController.text != rePasswordController.text
                          ? isValidRePassword = false
                          : isValidRePassword = true;
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              AuthNavigate(
                titleButton: "Login",
                titleNavigate: "Already have an account?",
                function: () {
                  //Navigator.of(context).pushReplacementNamed(SignInScreen.id);
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName(SignInScreen.id));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
