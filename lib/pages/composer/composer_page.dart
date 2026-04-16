import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// 制谱页面（占位）
class ComposerPage extends StatelessWidget {
  const ComposerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: Text('制谱', style: TextStyle(color: AppColors.textPrimary)),
      ),
    );
  }
}
