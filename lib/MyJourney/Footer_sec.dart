import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widgets/Colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.veryDarkGray.withOpacity(0.8),
        border: const Border(
          top: BorderSide(color: AppColors.primaryGold, width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaIcon(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                  onTap: () async {
                    final url = Uri.parse('https://github.com/faireenazaidi');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                    debugPrint('Opening GitHub');
                  }
              ),
              const SizedBox(width: 24),
              SocialMediaIcon(
                icon: FontAwesomeIcons.instagram,
                label: 'Instagram',
                  onTap: () async {
                    final url = Uri.parse('');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                    debugPrint('Opening Instagram');

                  }
              ),
              const SizedBox(width: 24),
              SocialMediaIcon(
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp',
                  onTap: () async {
                    final url = Uri.parse('');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                    debugPrint('Opening WhatsApp');

                  }
              ),
              const SizedBox(width: 24),
              SocialMediaIcon(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                  onTap: () async {
                    final url = Uri.parse('');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                    debugPrint('Opening LinkedIn');

                  }
              ),
            ],
          ),
          const SizedBox(height: 32),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 16, color: AppColors.textGray),
              children: [
                TextSpan(text: '© 2025 '),
                TextSpan(
                  text: 'Animesh Pratap Singh',
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: '. All rights reserved.'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 16, color: AppColors.textGray),
              children: [
                TextSpan(text: 'Crafted with '),
                TextSpan(
                  text: 'passion',
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: ' for mobile innovation ⚡'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SocialMediaIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    widget.onTap();
    if (_isPressed) {
      _controller.reverse();
      setState(() => _isPressed = false);
    } else {
      _controller.forward();
      setState(() => _isPressed = true);
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted && _isPressed) {
          _controller.reverse();
          setState(() => _isPressed = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: MouseRegion(
        onEnter: (_) => _controller.forward(),
        onExit: (_) => _controller.reverse(),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (0.1 * _controller.value),
              child: Transform.translate(
                offset: Offset(0, -5 * _controller.value),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.lerp(
                          AppColors.primaryGold.withOpacity(0.1),
                          AppColors.primaryGold,
                          _controller.value,
                        ),
                        border: Border.all(
                          color: Color.lerp(
                            AppColors.primaryGold.withOpacity(0.3),
                            AppColors.primaryGold,
                            _controller.value,
                          )!,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryGold
                                .withOpacity(0.3 * _controller.value),
                            blurRadius: 20 * _controller.value,
                            spreadRadius: 3 * _controller.value,
                          ),
                        ],
                      ),
                      child: Icon(
                        widget.icon,
                        color: Color.lerp(
                          AppColors.primaryGold,
                          AppColors.backgroundDark,
                          _controller.value,
                        ),
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.lerp(
                          AppColors.textGray,
                          AppColors.primaryGold,
                          _controller.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}