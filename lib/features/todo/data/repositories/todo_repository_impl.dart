import 'package:assesment_task_a2sv/core/error/failure.dart';
import 'package:assesment_task_a2sv/features/todo/data/datasources/remote_fetch.dart';
import 'package:assesment_task_a2sv/features/todo/domain/entities/todo_entity.dart';
import 'package:assesment_task_a2sv/features/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class TodoRepositoryImpl implements TodoRepository {
  final FetchApiService _apiService = FetchApiService();
  @override
  Future<Either<Failure, List<TodoModel>>> getTodos() async{
    // TODO: implement CreateTodo
    try {
      final result = await _apiService.getTodos();
      return Right(result);

      
    } catch (e) {
      return Left(ServerFailure());
      
    }
  }

  @override
  Future<Either<Failure, TodoModel>> DeleteTodo(id) async {
    try {
      final result = await _apiService.deleteTodo(id);
      return Right(result);

      
    } catch (e) {
      return Left(ServerFailure());
      
    }
  }

  @override
  Future<Either<Failure, TodoModel>> UpdateTodo(data) async{
    try {
      final result = await _apiService.getTodos();
      return Right(result);

      
    } catch (e) {
      return Left(ServerFailure());
      
    }
  }

  @override
  Future<Either<Failure, TodoModel>> CreateTodo(data) {
    // TODO: implement getTodos
    throw UnimplementedError();
  } 
  
}