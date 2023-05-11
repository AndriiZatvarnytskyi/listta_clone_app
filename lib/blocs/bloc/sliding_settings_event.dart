part of 'sliding_settings_bloc.dart';

// abstract class SlidingSettingsEvent extends Equatable {
//   const SlidingSettingsEvent();

//   @override
//   List<Object> get props => [];
// }

abstract class SlidingSettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OpenSettings extends SlidingSettingsEvent {
  OpenSettings({
    required this.index,
  });
  final int index;

  @override
  List<Object?> get props => [index];
}

// class CloseCalendar extends SlidingSettingsEvent {
//   @override
//   List<Object?> get props => [];
// }