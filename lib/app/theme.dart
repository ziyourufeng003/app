import 'package:flutter/material.dart';

/// 简洁白色主题色彩系统（拟物化质感）
class AppColors {
  // 主背景色 — 白色系
  static const Color bgPrimary = Color(0xFFF7F7F7);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgGrey = Color(0xFFEEEEEE);

  // 导航栏
  static const Color navBg = Color(0xFFF8F8F8);
  static const Color navTopBorder = Color(0xFFD9D9D9);

  // 选中色 — 暖金
  static const Color activeGold = Color(0xFFB8860B);
  static const Color activeGoldLight = Color(0xFFD4A843);

  // 未选中色
  static const Color inactive = Color(0xFF999999);

  // 制谱中心按钮
  static const Color centerBtnBg = Color(0xFFE8E8E8);
  static const Color centerBtnHighlight = Color(0xFFD0D0D0);

  // 文字
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF888888);

  // 卡片
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE0E0E0);
}

/// 全局主题配置
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.activeGold,
        surface: AppColors.bgWhite,
      ),
      fontFamily: 'PingFang SC',
      useMaterial3: true,
    );
  }
}
