part of 'calendar_bloc.dart';

enum CalendarStatus {
  initial,
  open,
  closed,
  error,
  loading,
//selected
}

extension CalendarStatusX on CalendarStatus {
  bool get isInitial => this == CalendarStatus.initial;
  bool get isOpen => this == CalendarStatus.open;
  bool get isClosed => this == CalendarStatus.closed;
  bool get isError => this == CalendarStatus.error;
  bool get isLoading => this == CalendarStatus.loading;
  //bool get isSelected => this == CalendarStatus.selected;
}

class InitialCalendar extends CalendarState {
  @override
  List<Object?> get props => [];
}

class CalendarState extends Equatable {
  CalendarState({
    this.status = CalendarStatus.open,
    dynamic focusDate,
  }) : focusDate = focusDate ?? DateTime.now();

  final DateTime focusDate;
  final CalendarStatus status;

  @override
  List<Object?> get props => [status, focusDate];

  CalendarState copyWith({CalendarStatus? status, dynamic focusDate}) {
    return CalendarState(
      focusDate: focusDate ?? this.focusDate,
      status: status ?? this.status,
    );
  }
}
