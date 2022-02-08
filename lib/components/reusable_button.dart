import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {

  final String title;
  final Color color;
  final Function function;

  ReusableButton({
    required this.title,
    required this.color,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(child: Text(title,style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),)),
      ),
    );
  }
}
