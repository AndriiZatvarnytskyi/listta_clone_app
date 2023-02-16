part of 'tasks_list_bloc.dart';

abstract class TaskListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectTaskDate extends TaskListEvent {
  SelectTaskDate({
    required this.taskDate,
  });
  final dynamic taskDate;

  @override
  List<Object?> get props => [taskDate];
}
