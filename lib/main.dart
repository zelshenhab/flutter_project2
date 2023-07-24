// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_project2/widgets/conter.dart';
import 'package:flutter_project2/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

// class for task(todo-card)
class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  // list of todos
  List allTasks = [
    Task(title: "Breakfast", status: true),
    Task(title: "Drink Coffee", status: false),
    Task(title: "Study", status: true),
    Task(title: "Gym", status: true),
  ];
  // To remove todo  when clicking on "delete" icon
  delete(int clickedTask) {
    setState(() {
      allTasks.remove(allTasks[clickedTask]);
    });
  }

// To remove all todos  when clicking on "delete" icon in the appBar
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

// To change the state of the todo (completed or not completed) when click on the todo
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

// To add new todo when clicking on "ADD" in the dialog widget
  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

// Create controller to get the text inside the textfield in the dialog widget
  final myController = TextEditingController();
// To calculate only completed todos
  int calculateCompletedTaskes() {
    int completedTaskes = 0;
    allTasks.forEach((item) {
      if (item.status) {
        completedTaskes++;
      }
    });
    return completedTaskes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                    padding: EdgeInsets.all(25),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: "Add New Task",
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                            onPressed: () {
                              addnewtask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(fontSize: 20),
                            )),
                      ],
                    )),
              );
            },
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 35,
            color: Color.fromARGB(255, 242, 139, 131),
          )
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
                allTodos: allTasks.length,
                allCompleted: calculateCompletedTaskes()),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 550,
              color: Color.fromARGB(255, 55, 63, 82),
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todocard(
                      // I will pass all these information when create the Todecard() widget in "todo-card.dart" file
                      vartitle: allTasks[index].title,
                      doneORnot: allTasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                      delete: delete,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
