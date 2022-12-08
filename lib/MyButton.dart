import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color colors;
  final VoidCallback onPress;
  const MyButton({
    super.key,
    required this.title,
    this.colors = Colors.white,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
          color: const Color.fromARGB(255, 28, 27, 27),
          height: 70,
          width: 50,
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: colors, fontSize: 20),
          )),
        ),
      ),
    );
  }
}
