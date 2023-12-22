import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'router/router.dart';

class FindMatchGameApp extends StatelessWidget {
  FindMatchGameApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Poppins'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );;
  }
}
