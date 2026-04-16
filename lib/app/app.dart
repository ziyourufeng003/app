import 'package:flutter/material.dart';
import 'theme.dart';
import '../widgets/main_scaffold.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '简谱工具箱',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScaffold(),
    );
  }
}
