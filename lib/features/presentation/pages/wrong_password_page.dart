import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/auth_flow_provider.dart';
import '../widget/curved_background.dart';
import '../widget/password_dots.dart';


class WrongPasswordPage extends ConsumerWidget {
  const WrongPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const PasswordDots(
            totalDots: 8,
            filledDots: 8,
            isError: true,
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              context.go('/password-recovery');
            },
            child: Text(
              'Forgot your password?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF4285F4),
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
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
