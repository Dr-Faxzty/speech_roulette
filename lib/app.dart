import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'core/constants/app_constants.dart';

class SpeechRouletteApp extends StatelessWidget {
  const SpeechRouletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppConstants.primaryColor,
        fontFamily: 'ComicNeue',
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
