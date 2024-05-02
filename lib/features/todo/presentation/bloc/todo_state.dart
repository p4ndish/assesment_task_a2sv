part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();  

  @override
  List<Object> get props => [];
}
class TodoLoading extends TodoState {}


class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  const TodoLoaded({required this.todos});
  @override
  // TODO: implement props
  List<Object> get props => [todos];
}
class TodoError extends TodoState { 
  final Failure error;

  TodoError(this.error); 
  @override
  // TODO: implement props
  List<Object> get props => [error];
  
}



class TodoDeleteState extends TodoState {
  final bool result;

  TodoDeleteState({required this.result});

  
 }

class TodoUpdateState extends TodoState {
  final bool result;

  TodoUpdateState({required this.result});

  
 }