import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// 首页 — 功能入口大厅
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: Text('首页', style: TextStyle(color: AppColors.textPrimary)),
      ),
    );
  }
}
