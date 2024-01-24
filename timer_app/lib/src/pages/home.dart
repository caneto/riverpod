import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/state.dart';
import 'view/timer_view_model.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final List<int> smList = List.generate(60, (index) => index);
  final List<int> hList = List.generate(24, (index) => index);
  int second = 0;
  int minute = 0;
  int hour = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(timerViewModelProvider);
    final stateNotifier = ref.watch(timerViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        title: const Center(
          child: Text(
            "Timer app",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.amber[100],
        child: Center(
          child: Container(
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue[200]!,
                width: 7,
              ), //Border.all
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.shade400,
                  offset: const Offset(
                    3.0,
                    4.0,
                  ), //Offset
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                const BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Horas'),
                      SizedBox(width: 66),
                      Text('Minutos'),
                      SizedBox(width: 66),
                      Text('Segundos'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        value: stateNotifier.getHour(),
                        items: hList.map((int item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.toString()),
                          );
                        }).toList(),
                        onChanged: (int? index) {
                          stateNotifier.setTotalSecond(
                              index!,
                              stateNotifier.getMinute(),
                              stateNotifier.getSecond());
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        child: const Text(":"),
                      ),
                      DropdownButton(
                        value: stateNotifier.getMinute(),
                        items: smList.map((int item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.toString()),
                          );
                        }).toList(),
                        onChanged: (int? index) {
                          stateNotifier.setTotalSecond(stateNotifier.getHour(),
                              index!, stateNotifier.getSecond());
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        child: const Text(":"),
                      ),
                      DropdownButton(
                        value: stateNotifier.getSecond(),
                        items: smList.map((int item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.toString()),
                          );
                        }).toList(),
                        onChanged: (int? index) {
                          stateNotifier.setTotalSecond(stateNotifier.getHour(),
                              stateNotifier.getMinute(), index!);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      side: const BorderSide(width: 2, color: Colors.white60),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.red,
                      padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
                    ),
                    onPressed: () {
                      if (state.timerState == TimerState.start) {
                        stateNotifier.setTimerState(TimerState.stop);
                        stateNotifier.stopTimer();
                      } else {
                        stateNotifier.setTimerState(TimerState.start);
                        stateNotifier.startTimer();
                      }
                    },
                    child: state.timerState == TimerState.start
                        ? const Text(
                            "Para",
                            style: TextStyle(color: Colors.white70),
                          )
                        : const Text(
                            "Inicio",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
