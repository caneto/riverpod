

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_gen_trial/features/home/state/home_state.dart';
 
part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    return const HomeState();
  }

  fetchSomething(){}
}
