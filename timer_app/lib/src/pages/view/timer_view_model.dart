import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enum/state.dart';
import '../../model/timer_model.dart';

final timerViewModelProvider =
    StateNotifierProvider.autoDispose<TimerViewModel, TimerModel>(
        (ref) => TimerViewModel());

class TimerViewModel extends StateNotifier<TimerModel> {
  TimerViewModel() : super(const TimerModel());

  late Timer _timer;

  int getSecond() {
    return ((state.totalSecond % 3600).round() % 60);
  }

  int getMinute() {
    return (((state.totalSecond % 3600).round() / 60).floor());
  }

  int getHour() {
    return (state.totalSecond / 3600).round();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (state.timerState == TimerState.start && state.totalSecond > 0) {
          state = state.setTotalSecond(state.totalSecond - 1);
        }
        checkIfFinished();
      },
    );
  }

  void checkIfFinished() {
    if (state.totalSecond == 0) {
      state.setTimerState(TimerState.reset);
      print("The time has come");
      _timer.cancel();
    }
  }

  void stopTimer() {
    _timer.cancel();
  }

  void setTotalSecond(int hour, int minute, int second) {
    int totalSecond = hour * 3600 + minute * 60 + second;
    state = state.setTotalSecond(totalSecond);
  }

  void setTimerState(TimerState timerState) {
    state = state.setTimerState(timerState);
  }
}