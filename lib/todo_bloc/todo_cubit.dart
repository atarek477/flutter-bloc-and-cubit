import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/task_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  addTask(TaskModel task){
    emit(TodoUpdate([... state.list,task]));
  }
  removeTask(TaskModel task){
   final newList = List<TaskModel>.from(state.list)
     ..removeWhere((t) => t.id == task.id);

   emit(TodoUpdate(newList));
  }

  toggleTask(TaskModel task){
    final updatedList = state.list.map((t) {
      if (t.id == task.id) {
        t.copyWith(isCompleted: !t.isCompleted);
      }
      return t;
    }).toList();

    emit(TodoUpdate(updatedList));
  }


}
