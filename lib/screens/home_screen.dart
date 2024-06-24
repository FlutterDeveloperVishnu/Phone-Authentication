import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth/phoneauth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => MaterialPageRoute(
                        builder: (context) => const PhoneAuth(),
                      ),
                    );
              },
              icon: const Icon(Icons.logout),
              label: const Text('logout')),
        ),
      ),
    );
  }
}
