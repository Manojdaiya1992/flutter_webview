import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPress;

  const Button({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            minimumSize: const Size(double.infinity, 70),
            elevation: 20.0),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
