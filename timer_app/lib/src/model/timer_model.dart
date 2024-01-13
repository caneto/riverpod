import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/state.dart';

part "timer_model.freezed.dart";

@freezed
class TimerModel with _$TimerModel {
  const TimerModel._();
  const factory TimerModel({
    // properties
    @Default(0) int totalSecond,
    @Default(TimerState.reset) TimerState timerState,
  }) = _TimerModel;

  // Methods
  TimerModel setTotalSecond(int totalSecond) =>
      copyWith(totalSecond: totalSecond);
  TimerModel setTimerState(TimerState timerState) =>
      copyWith(timerState: timerState);
}
