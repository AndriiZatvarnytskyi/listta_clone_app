part of 'sliding_settings_bloc.dart';

// abstract class SlidingSettingsState extends Equatable {
//   const SlidingSettingsState();

//   @override
//   List<Object> get props => [];
// }

//class SlidingSettingsInitial extends SlidingSettingsState {}

enum SlidingSettingsStatus { initial, open, closed, error, loading, selected }

extension SlidingSettingsStateX on SlidingSettingsStatus {
  bool get isInitial => this == SlidingSettingsStatus.initial;
  bool get isOpen => this == SlidingSettingsStatus.open;
  bool get isClosed => this == SlidingSettingsStatus.closed;
  bool get isError => this == SlidingSettingsStatus.error;
  bool get isLoading => this == SlidingSettingsStatus.loading;
  bool get isSelected => this == SlidingSettingsStatus.selected;
}

class SlidingSettingsInitial extends SlidingSettingsState {
  @override
  List<Object?> get props => [];
}

class SlidingSettingsState extends Equatable {
  const SlidingSettingsState({
    this.status = SlidingSettingsStatus.open,
    int? index,
  }) : index = index ?? 0;
  final int index;
  final SlidingSettingsStatus status;

  @override
  List<Object?> get props => [
        status,
        index,
      ];

  SlidingSettingsState copyWith(
      {SlidingSettingsStatus? status, dynamic index}) {
    return SlidingSettingsState(
      status: status ?? this.status,
      index: index ?? this.index,
    );
  }
}
