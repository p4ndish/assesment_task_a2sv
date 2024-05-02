part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoLoad extends TodoEvent { }

// on update 
class TodoUpdateEvent extends TodoEvent {
  final TodoModel data;

  TodoUpdateEvent({required this.data});
  
 }

 // on creating a todo 
class TodoCreateEvent extends TodoEvent {
  final TodoModel data;

  TodoCreateEvent({required this.data});
  
 }

 // on delete event
class TodoDeleteEvent extends TodoEvent {
  final int id;

  TodoDeleteEvent({required this.id});

  
 }
