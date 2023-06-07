import 'package:equatable/equatable.dart';

import '../../models/todo.dart';
import '../bloc_exports.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial(allToDos: <ToDo>[])) {
    void onAddToDo(AddToDo event, Emitter<TodoState> emit) {
      final TodoState state = this.state;
      emit(TodoState(
          allToDos: List<ToDo>.from(state.allToDos)..add(event.todo)));
    }

    void onUpdateToDo(UpdateTodo event, Emitter<TodoState> emit) {
      final TodoState state = this.state;
      final ToDo toDo = event.todo;
      final int index = state.allToDos.indexOf(
          state.allToDos.firstWhere((ToDo element) => element.id == toDo.id));
      final List<ToDo> allToDos = List<ToDo>.from(state.allToDos)
        ..removeAt(index);
      allToDos.insert(index, toDo);
      emit(TodoState(allToDos: allToDos));
    }

    void onDeleteToDo(DeleteTodo event, Emitter<TodoState> emit) {
      final TodoState state = this.state;
      final ToDo todo = event.todo;
      final List<ToDo> allToDos = List<ToDo>.from(state.allToDos)..remove(todo);
      emit(TodoState(allToDos: allToDos));
    }

    void onDeleteAllTodos(DeleteAllTodo event, Emitter<TodoState> emit) {
      emit(const TodoState());
    }

    on<AddToDo>(onAddToDo);
    on<UpdateTodo>(onUpdateToDo);
    on<DeleteTodo>(onDeleteToDo);
    on<DeleteAllTodo>(onDeleteAllTodos);
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toMap();
  }
}
