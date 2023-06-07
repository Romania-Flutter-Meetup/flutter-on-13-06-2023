part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => <Object>[];
}

class AddToDo extends TodoEvent {
  const AddToDo({required this.todo});
  final ToDo todo;

  @override
  List<Object> get props => <Object>[todo];
}

class UpdateTodo extends TodoEvent {
  const UpdateTodo({required this.todo});
  final ToDo todo;

  @override
  List<Object> get props => <Object>[todo];
}

class DeleteTodo extends TodoEvent {
  const DeleteTodo({required this.todo});
  final ToDo todo;

  @override
  List<Object> get props => <Object>[todo];
}

class DeleteAllTodo extends TodoEvent {}
