// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view.dart';

// **************************************************************************
// WidgetGenerator
// **************************************************************************

abstract class HomeViewBase extends ConsumerWidget {
  const HomeViewBase({Key? key}) : super(key: key);
  Widget builder(BuildContext context, HomeController controller,
      HomeState state, WidgetRef ref);
  get provider => homeControllerProvider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    return builder(context, controller, state, ref);
  }
}
