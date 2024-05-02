import 'package:assesment_task_a2sv/features/todo/domain/entities/todo_entity.dart';
import 'package:assesment_task_a2sv/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:assesment_task_a2sv/features/todo/presentation/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // shape: BoxShape.circle,

                color: const Color.fromARGB(231, 204, 204, 204),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "July 14, 2023",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Hello, Yohannes",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          
          }
           else if (state is TodoLoaded) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today’s Tasks"),
                      ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(211, 9, 31, 227),
                            foregroundColor: Color.fromARGB(210, 248, 248, 248),
                          ),

                          // new task
                          icon: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return modalContent(_titleController, _descriptionController, context);
                                  },
                                );
                              },
                              icon: Icon(Icons.add)),
                          label: const Text(
                            "New Task",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemCount: state.todos.length,
                        itemBuilder: (BuildContext context, index) {
                          return _customCard(context, state.todos[index] );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(color: Colors.transparent,),
                        ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("Something Went wrong"),
            );
          }
        },
      ),
    );
  }
}

Widget _customCard(BuildContext context, TodoModel todo) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // todo title
              GestureDetector(onTap: () {

              }, child: Text(todo.title)),

              // todo description
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                        todo.description),
                  ),
                  Checkbox(

                    
                    onChanged: (e) {},
                    value: todo.isCompleted,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ));
}


Widget modalContent(_titleController, _descriptionController, BuildContext context) { 
  return Container(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            color: Colors.white,
            child: Column(
              children: [
                const Text(
                  "Add New Todos",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: Text("Title"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                              hintText: "Add Title Here",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),

                      // input box for description
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: Text("Description"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                              hintText: "Add Description Here",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                        onPress: () {
                          // trigger event to create todo 
                          final data = TodoModel(title: _titleController, description: _descriptionController, isCompleted: false);
                          context.read<TodoBloc>()..add(TodoCreateEvent(data: data));
                        },
                        color: Colors.blue,
                        buttonText: "Add Todo"),
                    CustomButton(
                        onPress: () {},
                        color: Colors.red,
                        buttonText: "Add Todo"),
                  ],
                )
              ],
            )));
}