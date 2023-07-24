// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function changeStatus;
  final int index;
  final Function delete;

  const Todocard(
      {super.key,
      required this.vartitle,
      required this.doneORnot,
      required this.index,
      required this.delete,
      required this.changeStatus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(top: 25),
          padding: EdgeInsets.all(17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                    color: doneORnot ? Colors.black : Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: doneORnot
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Row(
                children: [
                  Icon(
                    doneORnot ? Icons.check : Icons.close,
                    size: 30,
                    color: doneORnot ? Colors.green[300] : Colors.red,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 25,
                    color: Color.fromARGB(255, 242, 139, 131),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
