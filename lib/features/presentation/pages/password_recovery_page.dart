import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/auth_flow_provider.dart';
import '../widget/curved_background.dart';


class PasswordRecoveryPage extends ConsumerWidget {
  const PasswordRecoveryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authFlowProvider);

    return CurvedBackground(
      showAvatar: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 240),
            Text(
              'Password Recovery',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'How you would like to restore\nyour password?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF6B7280),
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 60),
            // SMS Option
            GestureDetector(
              onTap: () {
                ref.read(authFlowProvider.notifier).setRecoveryMethod(RecoveryMethod.sms);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: authState.recoveryMethod == RecoveryMethod.sms
                      ? const Color(0xFF4285F4).withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: authState.recoveryMethod == RecoveryMethod.sms
                        ? const Color(0xFF4285F4)
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'SMS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: authState.recoveryMethod == RecoveryMethod.sms
                            ? const Color(0xFF4285F4)
                            : const Color(0xFF1A1A1A),
                      ),
                    ),
                    const Spacer(),
                    if (authState.recoveryMethod == RecoveryMethod.sms)
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4285F4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Email Option
            GestureDetector(
              onTap: () {
                ref.read(authFlowProvider.notifier).setRecoveryMethod(RecoveryMethod.email);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: authState.recoveryMethod == RecoveryMethod.email
                      ? const Color(0xFFE91E63).withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: authState.recoveryMethod == RecoveryMethod.email
                        ? const Color(0xFFE91E63)
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: authState.recoveryMethod == RecoveryMethod.email
                            ? const Color(0xFFE91E63)
                            : const Color(0xFF1A1A1A),
                      ),
                    ),
                    const Spacer(),
                    if (authState.recoveryMethod == RecoveryMethod.email)
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE91E63),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/recovery-code');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4285F4),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  context.go('/wrong-password');
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
