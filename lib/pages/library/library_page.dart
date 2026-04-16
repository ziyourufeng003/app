import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// 乐谱库页面（占位）
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: Text('乐谱库', style: TextStyle(color: AppColors.textPrimary)),
      ),
    );
  }
}
