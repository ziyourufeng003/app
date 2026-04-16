import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// 首页 — 参考UI设计布局：搜索栏+Banner+快捷入口+内容分区
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding + 12,
            left: 16,
            right: 16,
            bottom: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 搜索栏
              _SearchBar(),
              const SizedBox(height: 16),
              // Banner 轮播区
              _BannerArea(),
              const SizedBox(height: 20),
              // 5个快捷入口
              _QuickEntries(),
              const SizedBox(height: 24),
              // 动态曲谱分区
              _ContentSection(
                title: '动态曲谱',
                items: ['小星星', '欢乐颂', '两只老虎', '生日快乐'],
              ),
              const SizedBox(height: 24),
              // 精选推荐分区
              _ContentSection(
                title: '精选推荐',
                items: ['卡农', '天空之城', '千与千寻', '菊次郎的夏天'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 搜索栏
class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.white.withAlpha(200),
            blurRadius: 0,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Icon(Icons.search, size: 18, color: AppColors.inactive),
          const SizedBox(width: 8),
          Text(
            '搜索乐谱、工具...',
            style: TextStyle(fontSize: 13, color: AppColors.inactive),
          ),
        ],
      ),
    );
  }
}

/// Banner 轮播区（占位）
class _BannerArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8B86D),
            Color(0xFFD4A843),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(18),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.music_note, size: 36, color: Colors.white.withAlpha(200)),
            const SizedBox(height: 6),
            Text(
              '简谱工具箱',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white.withAlpha(220),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '你的音乐创作好帮手',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withAlpha(160),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 5个快捷入口 — 一排小图标
class _QuickEntries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entries = [
      _QuickEntry(icon: Icons.tune, label: '调音器', color: const Color(0xFFE8B86D)),
      _QuickEntry(icon: Icons.speed, label: '节拍器', color: const Color(0xFF7EB8DA)),
      _QuickEntry(icon: Icons.edit_note, label: '制谱', color: const Color(0xFFA8C97D)),
      _QuickEntry(icon: Icons.library_music, label: '乐谱库', color: const Color(0xFFD4A0C0)),
      _QuickEntry(icon: Icons.more_horiz, label: '更多', color: const Color(0xFF999999)),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: entries
          .map((e) => _QuickEntryItem(entry: e))
          .toList(),
    );
  }
}

class _QuickEntry {
  final IconData icon;
  final String label;
  final Color color;
  const _QuickEntry({required this.icon, required this.label, required this.color});
}

class _QuickEntryItem extends StatelessWidget {
  final _QuickEntry entry;
  const _QuickEntryItem({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 拟物化圆形图标
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.bgWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.white.withAlpha(200),
                blurRadius: 0,
                offset: const Offset(0, -1),
              ),
            ],
            border: Border.all(
              color: entry.color.withAlpha(50),
              width: 1,
            ),
          ),
          child: Icon(entry.icon, size: 22, color: entry.color),
        ),
        const SizedBox(height: 6),
        Text(
          entry.label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// 内容分区 — 标题 + 横向滚动列表
class _ContentSection extends StatelessWidget {
  final String title;
  final List<String> items;

  const _ContentSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 分区标题行
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              '更多 >',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.inactive,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // 横向滚动卡片
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return _ContentCard(title: items[index]);
            },
          ),
        ),
      ],
    );
  }
}

/// 内容卡片 — 拟物化白色风格
class _ContentCard extends StatelessWidget {
  final String title;

  const _ContentCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.white.withAlpha(200),
            blurRadius: 0,
            offset: const Offset(0, -1),
          ),
        ],
        border: Border.all(
          color: AppColors.cardBorder,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          // 封面区域
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Center(
              child: Icon(Icons.music_note, size: 28, color: AppColors.inactive),
            ),
          ),
          // 标题
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
