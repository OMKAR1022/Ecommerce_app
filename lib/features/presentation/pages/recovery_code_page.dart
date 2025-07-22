import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/auth_flow_provider.dart';
import '../widget/curved_background.dart';


class RecoveryCodePage extends ConsumerStatefulWidget {
  const RecoveryCodePage({super.key});

  @override
  ConsumerState<RecoveryCodePage> createState() => _RecoveryCodePageState();
}

class _RecoveryCodePageState extends ConsumerState<RecoveryCodePage> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }

    // Check if all fields are filled
    final code = _controllers.map((c) => c.text).join();
    if (code.length == 4) {
      ref.read(authFlowProvider.notifier).setRecoveryCode(code);
      // Simulate code verification
      Future.delayed(const Duration(milliseconds: 500), () {
        if (code == '1234') {
          context.go('/new-password');
        } else {
          // Show error or max attempts
          context.go('/max-attempts');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'Enter 4-digits code we sent you\non your phone number',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF6B7280),
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '+98*******00',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF1A1A1A),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            // Code input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) => _onCodeChanged(index, value),
                  ),
                );
              }),
            ),
            const Spacer(),
            SizedBox(
              width: 200,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Resend code logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE91E63),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Send Again',
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
                  context.go('/password-recovery');
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
