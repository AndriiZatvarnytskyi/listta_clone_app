part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectFocusDate extends CalendarEvent {
  SelectFocusDate({
    required this.focusDate,
  });
  final dynamic focusDate;

  @override
  List<Object?> get props => [focusDate];
}

class CloseCalendar extends CalendarEvent {
  @override
  List<Object?> get props => [];
}
