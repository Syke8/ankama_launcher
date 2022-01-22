import 'package:ankama_launcher/theme.dart';
import 'package:ankama_launcher/views/signin_page/signin_page.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));

  doWhenWindowReady(() {
    const windowSize = Size(1280, 720);

    appWindow.minSize = windowSize;
    appWindow.size = windowSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = 'Ankama Launcher Flutter';
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ankama Launcher Flutter',
          theme: ref.watch(themeProvider).data,
          home: child!,
        );
      },
      child: const SignInPage(),
    );
  }
}
