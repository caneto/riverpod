import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:riverpod_gen_trial/features/auth/controller/auth_controller.dart';
import 'package:riverpod_gen_trial/features/auth/state/auth_state.dart';
import 'package:riverpod_gen_trial/features/home/view/home_view.dart';
import 'package:riverpod_gen_trial/utils/app_color.dart';
import 'package:riverpod_widget_annotation/riverpod_widget_annotation.dart';

part 'auth_view.g.dart';

@RiverpodWidgetAnnotation(isAsync: true, showError: true, addLoading: true)
class AuthView extends AuthViewBase {
  const AuthView({super.key});

  @override
  Widget builder(BuildContext context, AuthController controller,
      AsyncValue<AuthState?> state, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.value?.teddyArtboard != null) const Teddy(),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.backgroundGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextField(
                        focusNode: state.value?.emailFocusNode,
                        controller: state.value?.emailController,
                        onTap: controller.lookOnTheTextField,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: controller.moveEyeBalls,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.backgroundGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextField(
                        focusNode: state.value?.passwordFocusNode,
                        onTap: controller.handsOnTheEyes,
                        controller: state.value?.passwordController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        obscureText: true,
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool isSuccessful = await controller.login();
                          if (isSuccessful) {
                            await Future.delayed(const Duration(seconds: 1));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeView()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//IF you wanna states in sub widgets you can use this   ....SubBase
class Teddy extends AuthViewSubBase {
  const Teddy({super.key});

  @override
  Widget builder(BuildContext context, AuthController controller,
      AsyncValue<AuthState?> state, WidgetRef ref) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Rive(
        artboard: state.value!.teddyArtboard!,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
