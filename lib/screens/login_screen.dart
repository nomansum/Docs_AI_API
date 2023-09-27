import 'package:docs_clone_flutter/colors.dart';
import 'package:docs_clone_flutter/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void signInWithGoogle(WidgetRef ref) {
    print("HERE");
    ref.read(authRepositoryProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            print("HERE");
            signInWithGoogle(ref);
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
