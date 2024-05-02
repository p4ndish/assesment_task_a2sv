import 'package:assesment_task_a2sv/core/error/failure.dart';
import 'package:assesment_task_a2sv/features/todo/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {

  Future<Either<Failure, List<TodoModel>>> getTodos();
  Future<Either<Failure, TodoModel>> CreateTodo(TodoModel data);
  Future<Either<Failure, TodoModel>> UpdateTodo(TodoModel data);
  Future<Either<Failure, TodoModel>> DeleteTodo(int id);


}