import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState()) {
    on<SelectFocusDate>(_focusDayChange);
  }

  void _focusDayChange(
      SelectFocusDate event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(status: CalendarStatus.loading));
    try {
      emit(
        state.copyWith(
          status: CalendarStatus.success,
          focusDate: event.focusDate,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CalendarStatus.error));
    }
  }
}
