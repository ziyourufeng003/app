import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// 节拍器页面（占位）
class MetronomePage extends StatelessWidget {
  const MetronomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: Text('节拍器', style: TextStyle(color: AppColors.textPrimary)),
      ),
    );
  }
}
