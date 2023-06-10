// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  ToDo({
    required this.id,
    required this.message,
    required this.isDone,
  });
  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'] as String,
      message: map['message'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  String id;
  String message;
  bool isDone;

  ToDo copyWith({
    String? id,
    String? message,
    bool? isDone,
  }) {
    return ToDo(
      id: id ?? this.id,
      message: message ?? this.message,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'isDone': isDone,
    };
  }

  @override
  List<Object?> get props => <dynamic>[id, message, isDone];
}
