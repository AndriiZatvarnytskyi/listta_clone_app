import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasks_list_event.dart';
part 'tasks_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  TaskListBloc() : super(TaskListState()) {
    on<SelectTaskDate>(_taskDayChange);
  }

  void _taskDayChange(SelectTaskDate event, Emitter<TaskListState> emit) async {
    emit(state.copyWith(status: TaskListStatus.loading));
    try {
      emit(
        state.copyWith(
          status: TaskListStatus.success,
          taskDate: event.taskDate,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: TaskListStatus.error));
    }
  }
}
