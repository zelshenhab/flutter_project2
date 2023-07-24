// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTodos;
  final int allCompleted;
  const Counter(
      {super.key, required this.allTodos, required this.allCompleted});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "$allCompleted/$allTodos",
        style: TextStyle(
            color: allCompleted == allTodos
                ? Color.fromARGB(255, 143, 240, 147)
                : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 45),
      ),
    );
  }
}
