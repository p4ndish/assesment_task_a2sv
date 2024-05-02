import 'package:assesment_task_a2sv/core/core.dart';
import 'package:assesment_task_a2sv/features/todo/domain/entities/todo_entity.dart';
import 'package:assesment_task_a2sv/features/todo/domain/usecases/deleteTodo_usecase.dart';
import 'package:assesment_task_a2sv/features/todo/domain/usecases/getTodos_usecase.dart';
import 'package:assesment_task_a2sv/features/todo/domain/usecases/upadteTodo_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodosUsecase _getTodosUsecase;
  final UpdateTodoUsecase _updateTodoUsecase;
  final DeleteTodoUsecase _deleteTodoUsecase;
  TodoBloc(this._getTodosUsecase, this._updateTodoUsecase, this._deleteTodoUsecase) : super(TodoLoading()) {
    on<TodoLoad>((event, emit)async {
      // TODO: implement event handler
      // no data will be passed 
      final result = await _getTodosUsecase.call("");
      
      result.fold(
        (failure) => emit(TodoError(failure)),
        (todos) => emit(TodoLoaded(todos: todos)));
      
    });
    on<TodoUpdateEvent>((event, emit)async {
      // TODO: implement event handler
      // no data will be passed 
      final result = await _updateTodoUsecase.call(event.data);
      
      result.fold(
        (failure) => emit(TodoError(failure)),
        (todos) => emit(TodoLoaded(todos: todos)));
      
    });

    // event on delete 
    on<TodoDeleteEvent>((event, emit) async {
      // TODO: implement event handler
      // no data will be passed 
      final result = await _getTodosUsecase.call(event);
      
      result.fold(
        (failure) => emit(TodoError(failure)),
        (todos) => emit(TodoLoaded(todos: todos)));
      
    });
  }
}
