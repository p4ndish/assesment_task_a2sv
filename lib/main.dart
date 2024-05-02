import 'package:assesment_task_a2sv/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:assesment_task_a2sv/features/todo/domain/usecases/deleteTodo_usecase.dart';
import 'package:assesment_task_a2sv/features/todo/domain/usecases/getTodos_usecase.dart';
import 'package:assesment_task_a2sv/features/todo/domain/usecases/upadteTodo_usecase.dart';
import 'package:assesment_task_a2sv/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:assesment_task_a2sv/features/todo/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
        GetTodosUsecase(
          TodoRepositoryImpl()
          ), 
          UpdateTodoUsecase(TodoRepositoryImpl()), 
          
          DeleteTodoUsecase(TodoRepositoryImpl()),
          )..add(TodoLoad()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
