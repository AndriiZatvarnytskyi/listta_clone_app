part of 'tasks_list_bloc.dart';

enum TaskListStatus { initial, success, error, loading, selected }

extension TaskStatusX on TaskListStatus {
  bool get isInitial => this == TaskListStatus.initial;
  bool get isSuccess => this == TaskListStatus.success;
  bool get isError => this == TaskListStatus.error;
  bool get isLoading => this == TaskListStatus.loading;
  bool get isSelected => this == TaskListStatus.selected;
}

class InitialTask extends TaskListState {
  @override
  List<Object?> get props => [];
}

class TaskListState extends Equatable {
  TaskListState({
    this.status = TaskListStatus.success,
    dynamic taskDate,
  }) : taskDate = taskDate ?? DateTime.now();

  final DateTime taskDate;
  final TaskListStatus status;

  @override
  List<Object?> get props => [
        status,
        taskDate,
      ];

  TaskListState copyWith({
    TaskListStatus? status,
    dynamic taskDate,
  }) {
    return TaskListState(
      taskDate: taskDate ?? this.taskDate,
      status: status ?? this.status,
    );
  }
}
