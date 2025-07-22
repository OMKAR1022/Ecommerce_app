import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/auth_flow_provider.dart';
import '../widget/curved_background.dart';
import '../widget/password_dots.dart';


class PasswordTypingPage extends ConsumerStatefulWidget {
  const PasswordTypingPage({super.key});

  @override
  ConsumerState<PasswordTypingPage> createState() => _PasswordTypingPageState();
}

class _PasswordTypingPageState extends ConsumerState<PasswordTypingPage> {
  String _password = '';

  void _addDigit(String digit) {
    if (_password.length < 8) {
      setState(() {
        _password += digit;
      });

      // Simulate password check after 5 digits
      if (_password.length == 5) {
        Future.delayed(const Duration(milliseconds: 500), () {
          // Simulate wrong password
          context.go('/wrong-password');
        });
      }
    }
  }

  void _removeDigit() {
    if (_password.isNotEmpty) {
      setState(() {
        _password = _password.substring(0, _password.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authFlowProvider);

    return CurvedBackground(
      showAvatar: true,
      child: Column(
        children: [
          const SizedBox(height: 240),
          Text(
            'Hello, ${authState.userName}!!',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Type your password',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF6B7280),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 40),
          PasswordDots(
            totalDots: 8,
            filledDots: _password.length,
          ),
          const Spacer(),
          // Custom keyboard would go here
          Container(
            height: 300,
            color: Colors.grey.withOpacity(0.1),
            child: const Center(
              child: Text(
                'Keyboard Interface',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
