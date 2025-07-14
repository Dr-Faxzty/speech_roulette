import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApplauseScreen extends StatelessWidget {
  const ApplauseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '👏👏👏',
              style: TextStyle(fontSize: 64),
            ),
            const SizedBox(height: 20),
            const Text(
              'Un applauso al nostro esperto!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.goNamed('home'),
              child: const Text('Rigioca'),
            )
          ],
        ),
      ),
    );
  }
}
