import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'sliding_settings_event.dart';
part 'sliding_settings_state.dart';

// class SlidingSettingsBloc
//     extends Bloc<SlidingSettingsEvent, SlidingSettingsState> {
//   SlidingSettingsBloc() : super(SlidingSettingsInitial()) {
//     on<SlidingSettingsEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class SlidingSettingsBloc
    extends Bloc<SlidingSettingsEvent, SlidingSettingsState> {
  SlidingSettingsBloc() : super(SlidingSettingsState()) {
    on<OpenSettings>(_focusDayChange);
  }
  

  void _focusDayChange(
      OpenSettings event, Emitter<SlidingSettingsState> emit) async {
    emit(state.copyWith(status: SlidingSettingsStatus.loading));

    try {
      if (state.status.isOpen) {
        emit(
          state.copyWith(
            status: SlidingSettingsStatus.loading,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: SlidingSettingsStatus.selected,
            index: event.index,
          ),
        );
      }
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: SlidingSettingsStatus.error));
    }
  }

  // void _closeCalendar(CloseCalendar event, Emitter<CalendarState> emit) async {
  //   try {
  //     if (state.status.isOpen) {
  //       emit(
  //         state.copyWith(
  //           status: CalendarStatus.closed,
  //         ),
  //       );
  //     } else if (state.status.isClosed) {
  //       emit(
  //         state.copyWith(
  //           status: CalendarStatus.open,
  //         ),
  //       );
  //     }
  //   } catch (error, stacktrace) {
  //     print(stacktrace);
  //     emit(state.copyWith(status: CalendarStatus.error));
  //   }
  // }
}
