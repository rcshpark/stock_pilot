import 'package:stock_pilot/core/const/app_color_const.dart';
import 'package:stock_pilot/core/const/app_text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground1,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkBackground1,
              AppColors.darkBackground2,
              AppColors.darkBackground1,
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const _HomeHeader(),
                    const SizedBox(height: 24),
                    const _MarketBriefCard(),
                    const SizedBox(height: 16),
                    const _SectionHeader(
                      title: '오늘의 주요 이슈',
                      actionLabel: '전체 보기',
                    ),
                    const SizedBox(height: 12),
                    const _IssueCard(
                      category: '반도체',
                      title: '삼성전자와 SK하이닉스, HBM 공급 기대감으로 동반 강세',
                      summary: 'AI 서버 투자 확대 기대가 반도체 밸류체인 전반으로 확산되고 있습니다.',
                      impact: '+3.1%',
                      tone: _CardTone.positive,
                      isInteractive: true,
                    ),
                    const SizedBox(height: 12),
                    const _IssueCard(
                      category: '2차전지',
                      title: '전기차 수요 둔화 우려에도 배터리 소재주는 실적 기대 유지',
                      summary: '실적 모멘텀과 단기 수급 부담이 동시에 존재하는 구간입니다.',
                      impact: '주의',
                      tone: _CardTone.neutral,
                    ),
                    const SizedBox(height: 20),
                    const _SectionHeader(
                      title: '관심 종목 브리핑',
                      actionLabel: '편집',
                    ),
                    const SizedBox(height: 12),
                    const _TickerBriefRow(),
                    const SizedBox(height: 20),
                    const _SectionHeader(
                      title: 'AI 브리핑',
                      actionLabel: '업데이트됨',
                    ),
                    const SizedBox(height: 12),
                    const _BriefInsightCard(),
                    const SizedBox(height: 20),
                    const _SectionHeader(
                      title: '커뮤니티 인기 토론',
                      actionLabel: '더 보기',
                    ),
                    const SizedBox(height: 12),
                    const _CommunityCard(
                      title: '오늘 반도체 랠리, 실적 선반영일까 추가 상승 시작일까?',
                      meta: '조회 1.2k · 댓글 84 · 공감 227',
                    ),
                    const SizedBox(height: 12),
                    const _CommunityCard(
                      title: '원달러 환율 하락이면 외국인 수급이 다시 들어올까',
                      meta: '조회 842 · 댓글 39 · 공감 110',
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _HomeBottomBar(),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('StockPilot', style: AppTextStyles.eyebrow),
                  SizedBox(height: 6),
                  Text(
                    '기업 지표를 읽고 투자 판단을 정리하는 파트너',
                    style: AppTextStyles.sectionLabel,
                  ),
                ],
              ),
            ),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.iconBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.panelBorder),
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            color: AppColors.panelBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.panelBorder),
          ),
          child: const TextField(
            style: AppTextStyles.textInputField,
            decoration: InputDecoration(
              hintText: '기업명 또는 종목코드를 검색하세요',
              hintStyle: AppTextStyles.hintText,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: AppColors.greyText1,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class _MarketBriefCard extends StatelessWidget {
  const _MarketBriefCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.panelBorder),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF132C63),
            Color(0xFF0A1020),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.panelShadow,
            blurRadius: 32,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'MARKET PULSE',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const Spacer(),
              const Text('09:10 업데이트', style: AppTextStyles.dividerText),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            '오늘 시장은 AI 반도체와 환율 안정 이슈가 주도하고 있습니다.',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.25,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '외국인 수급 회복 기대가 반도체 대형주에 집중되는 반면, 2차전지는 실적 확인 전까지 변동성이 이어질 가능성이 있습니다.',
            style: AppTextStyles.introSubtitle,
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              Expanded(
                child: _PulseMetric(label: 'KOSPI', value: '+1.14%'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _PulseMetric(label: 'KOSDAQ', value: '+0.62%'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _PulseMetric(label: '원/달러', value: '-7.30'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PulseMetric extends StatelessWidget {
  const _PulseMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.dividerText),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.actionLabel});

  final String title;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.sectionLabel),
        const Spacer(),
        Text(actionLabel, style: AppTextStyles.accentBlueText),
      ],
    );
  }
}

enum _CardTone { positive, neutral }

class _IssueCard extends StatelessWidget {
  const _IssueCard({
    required this.category,
    required this.title,
    required this.summary,
    required this.impact,
    required this.tone,
    this.isInteractive = false,
  });

  final String category;
  final String title;
  final String summary;
  final String impact;
  final _CardTone tone;
  final bool isInteractive;

  @override
  Widget build(BuildContext context) {
    final badgeColor = tone == _CardTone.positive
        ? const Color(0xFF0A7A42)
        : const Color(0xFF5B6475);

    final card = Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.iconBackground,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(category, style: AppTextStyles.dividerText),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  impact,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.35,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(summary, style: AppTextStyles.supportingText),
        ],
      ),
    );

    if (!isInteractive) {
      return card;
    }

    return InkWell(
      onTap: () => context.push('/article-detail'),
      borderRadius: BorderRadius.circular(24),
      child: card,
    );
  }
}

class _TickerBriefRow extends StatelessWidget {
  const _TickerBriefRow();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _TickerCard(
            name: '삼성전자',
            price: '74,200',
            change: '+2.6%',
            trend: 'AI 서버 수요',
          ),
          SizedBox(width: 12),
          _TickerCard(
            name: 'SK하이닉스',
            price: '188,500',
            change: '+3.9%',
            trend: 'HBM 공급 확대',
          ),
          SizedBox(width: 12),
          _TickerCard(
            name: 'POSCO홀딩스',
            price: '401,000',
            change: '-0.8%',
            trend: '원자재 부담',
          ),
        ],
      ),
    );
  }
}

class _TickerCard extends StatelessWidget {
  const _TickerCard({
    required this.name,
    required this.price,
    required this.change,
    required this.trend,
  });

  final String name;
  final String price;
  final String change;
  final String trend;

  @override
  Widget build(BuildContext context) {
    final positive = change.startsWith('+');

    return Container(
      width: 188,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTextStyles.heroStat),
          const SizedBox(height: 10),
          Text(
            price,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            change,
            style: TextStyle(
              color: positive ? const Color(0xFF4ADE80) : const Color(0xFFF87171),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(trend, style: AppTextStyles.dividerText),
        ],
      ),
    );
  }
}

class _BriefInsightCard extends StatelessWidget {
  const _BriefInsightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('오늘의 자동 해석', style: AppTextStyles.heroStat),
          SizedBox(height: 12),
          Text(
            '반도체 업종은 AI 수요 기대가 실적 상향 기대와 결합되며 강세입니다. 반면 2차전지는 장기 성장 스토리는 유효하지만 단기 수급 불안과 실적 확인 구간이 이어지고 있습니다.',
            style: AppTextStyles.supportingText,
          ),
          SizedBox(height: 14),
          Text(
            '체크 포인트: 외국인 수급 지속 여부, 환율 방향성, 미국 기술주 강세 연동.',
            style: AppTextStyles.dividerText,
          ),
        ],
      ),
    );
  }
}

class _CommunityCard extends StatelessWidget {
  const _CommunityCard({required this.title, required this.meta});

  final String title;
  final String meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.forum_rounded, color: AppColors.accentBlue, size: 18),
              SizedBox(width: 8),
              Text('실시간 토론', style: AppTextStyles.eyebrow),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(meta, style: AppTextStyles.dividerText),
        ],
      ),
    );
  }
}

class _HomeBottomBar extends StatelessWidget {
  const _HomeBottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(
            icon: Icons.home_rounded,
            label: '홈',
            selected: true,
          ),
          _BottomNavItem(
            icon: Icons.article_outlined,
            label: '뉴스',
          ),
          _BottomNavItem(
            icon: Icons.auto_graph_rounded,
            label: '브리핑',
          ),
          _BottomNavItem(
            icon: Icons.people_alt_outlined,
            label: '커뮤니티',
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.white : AppColors.greyText1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
