// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view.dart';

// **************************************************************************
// WidgetGenerator
// **************************************************************************

abstract class AuthViewBase extends ConsumerWidget {
  const AuthViewBase({Key? key}) : super(key: key);
  Widget builder(BuildContext context, AuthController controller,
      AsyncValue<AuthState?> state, WidgetRef ref);
  get provider => authControllerProvider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);
    state.showScaffoldErrorMessage(context, state.error.toString());
    return Stack(
      children: [
        builder(context, controller, state, ref),
        if (state.isLoading)
          const Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(child: CircularProgressIndicator()))),
          )
      ],
    );
  }
}

abstract class AuthViewSubBase extends ConsumerWidget {
  const AuthViewSubBase({Key? key}) : super(key: key);
  Widget builder(BuildContext context, AuthController controller,
      AsyncValue<AuthState?> state, WidgetRef ref);
  get provider => authControllerProvider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);
    return builder(context, controller, state, ref);
  }
}

extension AsyncValueUI on AsyncValue {
  void showScaffoldErrorMessage(BuildContext context, String text) {
    if (hasError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    }
  }
}
