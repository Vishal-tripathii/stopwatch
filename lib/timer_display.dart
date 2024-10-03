import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final String elapsedTime; // Pass the formatted time as a string

  const TimerDisplay({Key? key, required this.elapsedTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
      elapsedTime, // Display the time
      style: const TextStyle(
        fontSize: 48.0, // Adjust the size to fit your design
        fontWeight: FontWeight.bold,
        color: Colors.yellow
      ),
    )
    );
  }
}
