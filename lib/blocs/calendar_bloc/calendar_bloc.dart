import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/task.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState()) {
    on<SelectFocusDate>(_focusDayChange);
    on<CloseCalendar>(_closeCalendar);
  }

  void _focusDayChange(
      SelectFocusDate event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(status: CalendarStatus.loading));
    try {
      emit(
        state.copyWith(
          status: CalendarStatus.open,
          focusDate: event.focusDate,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CalendarStatus.error));
    }
  }

  void _closeCalendar(CloseCalendar event, Emitter<CalendarState> emit) async {
    try {
      if (state.status.isOpen) {
        emit(
          state.copyWith(
            status: CalendarStatus.closed,
          ),
        );
      } else if (state.status.isClosed) {
        emit(
          state.copyWith(
            status: CalendarStatus.open,
          ),
        );
      }
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CalendarStatus.error));
    }
  }
}
