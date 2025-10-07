import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widgets/Colors.dart';
import 'Animated_button.dart';
import 'Animatedcard.dart';
import 'Sec_title.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // void _sendMessage() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() => _isSending = true);
  //
  //     await Future.delayed(const Duration(seconds: 2));
  //
  //     if (mounted) {
  //       setState(() => _isSending = false);
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Message sent successfully!'),
  //           backgroundColor: AppColors.primaryGold,
  //         ),
  //       );
  //
  //       _nameController.clear();
  //       _emailController.clear();
  //       _messageController.clear();
  //     }
  //   }
  // }

  void _sendMessage() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSending = true);

      // const serviceId = 'your_service_id';
      // const templateId = 'your_template_id';
      // const publicKey = 'your_public_key';
      const serviceId = 'service_4qriy3e';
      const templateId = 'template_i2gwxjr';
      const publicKey = 'kTxK3Gf8mAWpPbxHC';

      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

      try {
        final response = await http.post(
          url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': publicKey,
            'template_params': {
              'user_name': _nameController.text,
              'user_email': _emailController.text,
              'message': _messageController.text,
            }
          }),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message sent successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to send message: ${response.body}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        if (mounted) setState(() => _isSending = false);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 40,
        vertical: 80,
      ),
      child: Column(
        children: [
          const SectionTitle(title: 'GET IN TOUCH'),
          const SizedBox(height: 64),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: AnimatedCard(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(
                      controller: _nameController,
                      label: 'Your Name',
                      hint: 'Enter Your Name',
                     // icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(
                      controller: _emailController,
                      label: 'Your Email',
                      hint: 'Enter Your Email',
                     // icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(
                      controller: _messageController,
                     // icon: Icons.message_outlined,
                      label: 'Message',
                      hint: 'Your message here...',
                      maxLines: 5,
                    ),
                    const SizedBox(height: 32),
                    AnimatedButton(
                      text: _isSending ? 'Sending...' : 'Send Message',
                      isPrimary: true,
                      onTap: _isSending ? null : _sendMessage,
                      fullWidth: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
   // required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.primaryGold,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(color: AppColors.textWhite, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textGray.withOpacity(0.5)),
          //  prefixIcon: Icon(icon, color: AppColors.primaryGold),
            filled: true,
            fillColor: AppColors.backgroundDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryGold.withOpacity(0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryGold.withOpacity(0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primaryGold,
                width: 2,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            if (label == 'Your Email' && !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }
}
class ContactItem extends StatefulWidget {
  final String icon;
  final String text;

  const ContactItem({super.key, required this.icon, required this.text});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: MouseRegion(
        onEnter: (_) => _controller.forward(),
        onExit: (_) => _controller.reverse(),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -3 * _controller.value),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Color.lerp(
                    AppColors.primaryGold.withOpacity(0.1),
                    AppColors.primaryGold.withOpacity(0.2),
                    _controller.value,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color.lerp(
                      AppColors.primaryGold.withOpacity(0.3),
                      AppColors.primaryGold,
                      _controller.value,
                    )!,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGold.withOpacity(0.1 + 0.2 * _controller.value),
                      blurRadius: 10 + 20 * _controller.value,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.icon, style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 8),
                    Text(widget.text, style: const TextStyle(color: Colors.white, fontSize: 14,),
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
