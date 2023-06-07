// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({this.allToDos = const <ToDo>[]});
  final List<ToDo> allToDos;

  @override
  List<Object> get props => <Object>[allToDos];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allToDos': allToDos.map((ToDo x) => x.toMap()).toList(),
    };
  }

  factory TodoState.fromMap(Map<String, dynamic> map) {
    return TodoState(
      allToDos: List<ToDo>.from(
        (map['allToDos'] as List<dynamic>).map<ToDo>(
          (dynamic x) => ToDo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class TodoInitial extends TodoState {
  const TodoInitial({required super.allToDos});
}
