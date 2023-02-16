part of 'calendar_bloc.dart';

enum CalendarStatus { initial, success, error, loading, selected }

extension CalendarStatusX on CalendarStatus {
  bool get isInitial => this == CalendarStatus.initial;
  bool get isSuccess => this == CalendarStatus.success;
  bool get isError => this == CalendarStatus.error;
  bool get isLoading => this == CalendarStatus.loading;
  bool get isSelected => this == CalendarStatus.selected;
}

class InitialCalendar extends CalendarState {
  @override
  List<Object?> get props => [];
}

class CalendarState extends Equatable {
  CalendarState({
    this.status = CalendarStatus.success,
    dynamic focusDate,
    dynamic haveTask,
  })  : focusDate = focusDate ?? DateTime.now(),
        haveTask = haveTask ?? true;

  final dynamic focusDate;
  final dynamic haveTask;
  final CalendarStatus status;

  @override
  List<Object?> get props => [
        status,
        haveTask,
        focusDate,
      ];

  CalendarState copyWith({
    CalendarStatus? status,
    dynamic focusDate,
    dynamic haveTask,
  }) {
    return CalendarState(
      focusDate: focusDate ?? this.focusDate,
      haveTask: haveTask ?? this.haveTask,
      status: status ?? this.status,
    );
  }
}
