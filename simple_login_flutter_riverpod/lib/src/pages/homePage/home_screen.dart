
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_login_flutter_riverpod/src/app.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showPassState = ref.watch(showPassProvider);
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flutter Mostrar/Ocultar Senha Demo Riverpod",
            style: TextStyle(fontSize: 18,color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade700.withOpacity(.4),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Image.asset("assets/devs.jpg",height: 130,width: 160,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Login",
                  hintText: "Diginte seu Login",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: showPassState,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: showPassState
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () => ref
                        .read(showPassProvider.notifier)
                        .update((state) => !state),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Senha",
                  hintText: "Digite sua senha",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}