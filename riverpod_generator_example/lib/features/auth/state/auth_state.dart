import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rive/rive.dart';
part 'auth_state.freezed.dart';
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) Artboard? teddyArtboard,
    @Default(null) StateMachineController? stateMachineController,
    @Default(null) TextEditingController? emailController,
    @Default(null) TextEditingController? passwordController,
    @Default(null) SMITrigger? successTrigger,
    @Default(null) SMITrigger? failTrigger,
    @Default(null) SMIBool? isHandsUp,
    @Default(null) SMIBool? isChecking,
    @Default(null) SMINumber? numLook,
    @Default(null) FocusNode? emailFocusNode,
    @Default(null) FocusNode? passwordFocusNode,
  }) = _AuthState;
}
