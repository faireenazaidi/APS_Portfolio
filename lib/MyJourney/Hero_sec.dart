import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';
import 'Animated_button.dart';
import 'Contact_item.dart';
import 'package:dio/dio.dart';
import 'package:universal_html/html.dart' as html;

class HeroSection extends StatefulWidget {
  final AnimationController glowController;
  final VoidCallback onProjectsTap;
  final VoidCallback? onExperienceTap;

  const HeroSection({
    super.key,
    required this.glowController,
    required this.onProjectsTap,
     this.onExperienceTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 40,
        vertical: isSmallScreen ? 60 : 100,
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              AnimatedBuilder(
                animation: widget.glowController,
                builder: (context, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [Colors.white, AppColors.primaryGold],
                      ).createShader(bounds);
                    },
                    child: Text('ANIMESH PRATAP SINGH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 32 : 50,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -2,
                        shadows: [
                          Shadow(
                            color: AppColors.primaryGold.withOpacity(
                              0.5 + widget.glowController.value * 0.3,
                            ),
                            blurRadius: 10 + widget.glowController.value * 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Text('Android Developer | Java & Kotlin Expert',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmallScreen ? 18 : 24,
                  color: AppColors.primaryGold,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: const [
                  ContactItem(icon: '📱', text: '9807039752'),
                  ContactItem(icon: '📧', text: 'Animesh.singh222@gmail.com'),
                  ContactItem(icon: '📍', text: 'Lucknow'),
                ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 0 : 40),
                child: Text(
                  'Goal-oriented Android developer with 4+ years of experience building high-quality mobile applications. '
                      'Specialized in clean architecture, modern Android development practices, and creating intuitive user experiences.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    color: AppColors.textGray,
                    height: 1.8,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              isSmallScreen
                  ? Column(
                children: [
                  AnimatedButton(
                    text: 'View Projects',
                    isPrimary: true,
                    onTap: widget.onProjectsTap,
                    fullWidth: true,
                  ),
                  const SizedBox(height: 16),
                  AnimatedButton(
                    text: 'Download CV',
                    isPrimary: false,
                    onTap: (){
                      downloadCV(context);
                    },
                    fullWidth: true,
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedButton(
                    text: 'View Projects',
                    isPrimary: true,
                    onTap: widget.onProjectsTap,
                  ),
                  const SizedBox(width: 24),
                  AnimatedButton(
                    text: 'Download CV',
                    isPrimary: false,
                    onTap: (){
                      downloadCV(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Future<void> downloadCV(BuildContext context) async {
  try {
    if (kIsWeb) {
      //final url = "https://raw.githubusercontent.com/faireenazaidi/my_portfolio_/main/Faireena_Resume-1.pdf";
      final url = "";
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "Animesh_CV.pdf")
        ..click();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CV download started in browser")),
      );
      return;
    }

    if (Platform.isAndroid) {
      if (await Permission.manageExternalStorage.request().isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Storage permission denied")),
        );
        return;
      }
    } else if (Platform.isIOS) {
      if (await Permission.photos.request().isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Photos permission denied")),
        );
        return;
      }
    }

    Directory downloadsDir;
    if (Platform.isAndroid) {
      downloadsDir = Directory('/storage/emulated/0/Download');
    } else {
      downloadsDir = await getApplicationDocumentsDirectory();
    }

    final filePath = "${downloadsDir.path}/Animesh_CV.pdf";

    await Dio().download(
     // "https://raw.githubusercontent.com/faireenazaidi/my_portfolio_/main/Faireena_Resume-1.pdf",
      '',
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          debugPrint(
              "Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("CV downloaded successfully!"),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Download failed: $e"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

