import 'package:flutter/material.dart';


class AuthNavigate extends StatelessWidget {
  final String titleNavigate;
  final String titleButton;
  final Function function;

  AuthNavigate(
      {required this.titleButton,
        required this.titleNavigate,
        required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          titleNavigate,
          style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        ),
        GestureDetector(
          onTap: () => function(),
          child: Text(
            titleButton,
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}