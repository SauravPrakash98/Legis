import 'package:flutter/material.dart';
import 'package:untitled1/Auth/AuthHandler.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    return  Scaffold(
      body: ElevatedButton(
        child: const Text(
          'SignOut'
        ),
        onPressed: () {
          AuthHandler.signOut();
          Navigator.pop(context);
        },
      )
    );
  }
}