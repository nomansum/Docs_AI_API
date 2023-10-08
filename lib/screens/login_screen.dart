import 'package:docs_clone_flutter/colors.dart';
import 'package:docs_clone_flutter/repository/auth_repository.dart';
import 'package:docs_clone_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void signInWithGoogle(WidgetRef ref, BuildContext context) async {
    final errormodel =
        await ref.read(authRepositoryProvider).signInWithGoogle();
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    if (errormodel.error == null) {
      ref.read(userProvider.notifier).update((state) => errormodel.data);
      navigator.push(MaterialPageRoute(builder: (context) => HomeScreen()));
      print("HERE LOGIN");
    } else {
      sMessenger.showSnackBar(SnackBar(content: Text(errormodel.error!)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            signInWithGoogle(ref, context);
          },
          icon: Image.asset(
            "assets/images/g-logo-2.png",
            height: 20,
          ),
          label: Text(
            "Sign in With Google",
            style: TextStyle(color: kblackColor),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: kwhiteColor, minimumSize: const Size(150, 50)),
        ),
      ),
    );
  }
}
