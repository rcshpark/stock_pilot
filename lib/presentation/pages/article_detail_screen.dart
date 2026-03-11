import 'package:stock_pilot/core/const/app_color_const.dart';
import 'package:stock_pilot/core/const/app_text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

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
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _DetailTopBar(
                      onBack: () => context.pop(),
                    ),
                    const SizedBox(height: 24),
                    const _HeroCard(),
                    const SizedBox(height: 16),
                    const _SummarySection(),
                    const SizedBox(height: 16),
                    const _TakeawayGrid(),
                    const SizedBox(height: 16),
                    const _RelatedTickersSection(),
                    const SizedBox(height: 16),
                    const _TimelineSection(),
                    const SizedBox(height: 16),
                    const _CommunitySection(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _BottomActionBar(),
    );
  }
}

class _DetailTopBar extends StatelessWidget {
  const _DetailTopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TopBarButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: onBack,
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('상세 브리핑', style: AppTextStyles.sectionLabel),
              SizedBox(height: 4),
              Text('2026.03.11 09:10 업데이트', style: AppTextStyles.dividerText),
            ],
          ),
        ),
        const _TopBarButton(icon: Icons.bookmark_border_rounded),
        const SizedBox(width: 8),
        const _TopBarButton(icon: Icons.ios_share_rounded),
      ],
    );
  }
}

class _TopBarButton extends StatelessWidget {
  const _TopBarButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: AppColors.iconBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.panelBorder),
        ),
        child: Icon(icon, color: AppColors.white, size: 20),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.panelBorder),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF101A36),
            Color(0xFF122C66),
            Color(0xFF0B1120),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.panelShadow,
            blurRadius: 36,
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
                child: const Text('반도체', style: AppTextStyles.dividerText),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A7A42),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  '+3.1% 영향',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            '삼성전자와 SK하이닉스, HBM 공급 기대감으로 동반 강세',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: -1.0,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'AI 서버 투자 확대 기대가 메모리 업황 전반으로 번지며, 대형 반도체주 중심의 수급 회복 신호가 포착되고 있습니다.',
            style: AppTextStyles.introSubtitle,
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(
                child: _HeroMetric(label: '신뢰도', value: '88/100'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _HeroMetric(label: '시장 반응', value: '긍정'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _HeroMetric(label: '관련 기사', value: '24건'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({required this.label, required this.value});

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

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PanelHeader(
            title: 'AI 요약',
            trailing: '핵심만 보기',
          ),
          SizedBox(height: 14),
          Text(
            '이번 기사군의 핵심은 HBM과 고부가 메모리 중심의 수요 가시성이 높아졌다는 점입니다. 시장은 단순 뉴스보다는 실제 발주 확대 가능성을 가격에 반영하는 중이며, 외국인 수급이 대형주에 집중되는 흐름도 함께 나타납니다.',
            style: AppTextStyles.supportingText,
          ),
          SizedBox(height: 14),
          Text(
            '단기적으로는 추가 수주 뉴스와 미국 기술주 흐름이 같은 방향으로 이어질 때 탄력이 커질 가능성이 있습니다.',
            style: AppTextStyles.supportingText,
          ),
        ],
      ),
    );
  }
}

class _TakeawayGrid extends StatelessWidget {
  const _TakeawayGrid();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _InsightCard(
                title: 'Positive',
                headline: '수급 개선',
                body: '외국인 매수 유입이 대형 반도체주에 집중되고 있습니다.',
                accent: Color(0xFF22C55E),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _InsightCard(
                title: 'Watch',
                headline: '밸류 부담',
                body: '주가 선반영 구간에서는 신규 모멘텀 확인이 필요합니다.',
                accent: Color(0xFFF59E0B),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        _Panel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PanelHeader(
                title: '체크 포인트',
                trailing: '오늘 장중',
              ),
              SizedBox(height: 14),
              _CheckItem(text: 'HBM 공급 계약 또는 CAPA 증설 뉴스 추가 여부'),
              SizedBox(height: 10),
              _CheckItem(text: '원/달러 환율 안정이 외국인 수급으로 이어지는지'),
              SizedBox(height: 10),
              _CheckItem(text: '미국 AI 관련주 강세가 국내 반도체로 재연결되는지'),
            ],
          ),
        ),
      ],
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.title,
    required this.headline,
    required this.body,
    required this.accent,
  });

  final String title;
  final String headline;
  final String body;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: accent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.45),
                  blurRadius: 14,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTextStyles.dividerText),
          const SizedBox(height: 8),
          Text(
            headline,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(body, style: AppTextStyles.supportingText),
        ],
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  const _CheckItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.accentBlue,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: AppTextStyles.supportingText),
        ),
      ],
    );
  }
}

class _RelatedTickersSection extends StatelessWidget {
  const _RelatedTickersSection();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PanelHeader(
            title: '연관 종목',
            trailing: '실시간',
          ),
          SizedBox(height: 14),
          _TickerTile(
            name: '삼성전자',
            price: '74,200',
            change: '+2.6%',
            note: 'AI 서버 수요 기대',
          ),
          SizedBox(height: 12),
          _TickerTile(
            name: 'SK하이닉스',
            price: '188,500',
            change: '+3.9%',
            note: 'HBM 공급 확대 전망',
          ),
          SizedBox(height: 12),
          _TickerTile(
            name: '한미반도체',
            price: '96,400',
            change: '+1.8%',
            note: '장비 수혜 기대',
          ),
        ],
      ),
    );
  }
}

class _TickerTile extends StatelessWidget {
  const _TickerTile({
    required this.name,
    required this.price,
    required this.change,
    required this.note,
  });

  final String name;
  final String price;
  final String change;
  final String note;

  @override
  Widget build(BuildContext context) {
    final positive = change.startsWith('+');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.heroStat),
                const SizedBox(height: 6),
                Text(note, style: AppTextStyles.dividerText),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
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
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineSection extends StatelessWidget {
  const _TimelineSection();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PanelHeader(
            title: '뉴스 플로우',
            trailing: '최근 6시간',
          ),
          SizedBox(height: 16),
          _TimelineItem(
            time: '09:10',
            title: '외국인 순매수 상위에 삼성전자, SK하이닉스 동시 진입',
          ),
          SizedBox(height: 14),
          _TimelineItem(
            time: '08:40',
            title: 'HBM 공급 관련 추가 수주 기대 보도 확산',
          ),
          SizedBox(height: 14),
          _TimelineItem(
            time: '07:55',
            title: '미국 AI 서버 투자 확대 전망 재부각',
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.time, required this.title});

  final String time;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 44,
          child: Text(time, style: AppTextStyles.accentBlueText),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColors.panelBorder, width: 1.2),
              ),
            ),
            child: Text(title, style: AppTextStyles.supportingText),
          ),
        ),
      ],
    );
  }
}

class _CommunitySection extends StatelessWidget {
  const _CommunitySection();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PanelHeader(
            title: '커뮤니티 반응',
            trailing: '인기순',
          ),
          SizedBox(height: 14),
          _CommunityReactionCard(
            title: 'HBM 기대감이 이번에는 진짜 실적으로 연결될까?',
            meta: '댓글 84 · 공감 227',
          ),
          SizedBox(height: 12),
          _CommunityReactionCard(
            title: '외국인 수급이 하루짜리인지, 추세 전환인지 의견이 갈립니다.',
            meta: '댓글 39 · 공감 110',
          ),
        ],
      ),
    );
  }
}

class _CommunityReactionCard extends StatelessWidget {
  const _CommunityReactionCard({required this.title, required this.meta});

  final String title;
  final String meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          Text(meta, style: AppTextStyles.dividerText),
        ],
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: const BoxDecoration(
        color: AppColors.darkBackground2_60,
        border: Border(top: BorderSide(color: AppColors.panelBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.panelBorder),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                backgroundColor: AppColors.iconBackground,
              ),
              icon: const Icon(Icons.forum_outlined),
              label: const Text('토론 보기'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.loginButtonBackground,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              icon: const Icon(Icons.auto_awesome_rounded),
              label: const Text('AI 분석 저장'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: child,
    );
  }
}

class _PanelHeader extends StatelessWidget {
  const _PanelHeader({required this.title, required this.trailing});

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.sectionLabel),
        const Spacer(),
        Text(trailing, style: AppTextStyles.accentBlueText),
      ],
    );
  }
}
