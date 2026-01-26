import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';

class ApplauseScreen extends StatelessWidget {
  const ApplauseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Diamo un applauso meritatissimo per questo intervento eccezzionale!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/img/gif/handclap.gif',
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFC107),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () => context.goNamed('home'),
              child: const Text('Rigioca', style: TextStyle(color: Colors.black,),),
            )
          ],
        ),
      ),
    );
  }
}
