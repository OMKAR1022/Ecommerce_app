import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/auth_flow_provider.dart';
import '../widget/curved_background.dart';


class PasswordPage extends ConsumerWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authFlowProvider);

    return CurvedBackground(
      showAvatar: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 200,right: 24,left: 24),
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
            TextField(),
            const SizedBox(height: 40),
            Text('Forget password ?'),


            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
