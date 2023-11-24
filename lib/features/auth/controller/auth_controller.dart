import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_gen_trial/features/auth/state/auth_state.dart';
import 'package:riverpod_gen_trial/utils/animation_states.dart';
import 'package:riverpod_gen_trial/utils/app_constants.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<AuthState> build() {
    state = AsyncData(AuthState(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      emailFocusNode: FocusNode(),
      passwordFocusNode: FocusNode(),
    ));
    _init();
    return state.value!;
  }

  _init() {
    listenFocus();
    initRive();
  }

  void listenFocus() {
    state.value?.emailFocusNode?.addListener(emailFocus);
    state.value?.passwordController?.addListener(passwordFocus);
  }

  void emailFocus() {
    state.value?.isChecking
        ?.change(state.value?.emailFocusNode?.hasFocus ?? false);
  }

  void passwordFocus() {
    state.value?.isHandsUp
        ?.change(state.value?.passwordFocusNode?.hasFocus ?? false);
  }

  Future initRive() async {
    rootBundle.load(AppConstants.animationUrl).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        state = AsyncData(state.value!.copyWith(
            stateMachineController: StateMachineController.fromArtboard(
                artboard, "Login Machine")));

        if (state.value?.stateMachineController != null) {
          artboard.addController(state.value!.stateMachineController!);

          for (var e in state.value!.stateMachineController!.inputs) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          }

          for (var element in state.value!.stateMachineController!.inputs) {
            if (element.name == AnimationStates.trigSuccess.name) {
              state = AsyncData(
                  state.value!.copyWith(successTrigger: element as SMITrigger));
            } else if (element.name == AnimationStates.trigFail.name) {
              state = AsyncData(
                  state.value!.copyWith(failTrigger: element as SMITrigger));
            } else if (element.name == AnimationStates.isHandsUp.name) {
              state = AsyncData(
                  state.value!.copyWith(isHandsUp: element as SMIBool));
            } else if (element.name == AnimationStates.isChecking.name) {
              state = AsyncData(
                  state.value!.copyWith(isChecking: element as SMIBool));
            } else if (element.name == AnimationStates.numLook.name) {
              state = AsyncData(
                  state.value!.copyWith(numLook: element as SMINumber));
            }
          }
        }
        state = AsyncData(state.value!.copyWith(teddyArtboard: artboard));
      },
    );
  }

  void handsOnTheEyes() {
    state.value?.isHandsUp?.change(true);
  }

  void lookOnTheTextField() {
    state.value?.isHandsUp?.change(false);
    state.value?.isChecking?.change(true);
    state.value?.numLook?.change(0);
  }

  void moveEyeBalls(val) {
    state.value?.numLook?.change(val.length.toDouble());
  }

  Future<bool> login() async {
    state.value?.passwordFocusNode?.unfocus();
    state.value?.emailFocusNode?.unfocus();
    state.value?.isChecking?.change(false);
    state.value?.isHandsUp?.change(false);

    state = const AsyncLoading();

    await Future.delayed(
      const Duration(milliseconds: 2000),
    );

    state = AsyncData(state.value!);

    if (state.value?.emailController?.text == "admin" &&
        state.value?.passwordController?.text == "admin") {
      state.value?.successTrigger?.fire();
      return true;
    } else {
      state.value?.failTrigger?.fire();
      return false;
    }
  }
}
