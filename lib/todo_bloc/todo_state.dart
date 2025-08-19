part of 'todo_cubit.dart';

@immutable
sealed class TodoState extends Equatable {
   final List<TaskModel> list;
   const TodoState(this.list);
   @override
   List<Object?> get props => [list];

}

final class TodoInitial extends TodoState {
  TodoInitial():super([]);

}

final class TodoUpdate extends TodoState {
  const TodoUpdate(super.list);
}
