import 'package:assesment_task_a2sv/core/core.dart';
import 'package:assesment_task_a2sv/features/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteTodoUsecase extends UseCase {
  final TodoRepository _repository;

  DeleteTodoUsecase(this._repository);
  @override
  Future<Either<Failure, dynamic>> call(id) {
    // TODO: implement call
    return _repository.DeleteTodo(id);

    
  } 
  
}