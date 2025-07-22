import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final flashSaleTimerProvider = StateNotifierProvider<FlashSaleTimerNotifier, Duration>((ref) {
  return FlashSaleTimerNotifier();
});

class FlashSaleTimerNotifier extends StateNotifier<Duration> {
  Timer? _timer;

  FlashSaleTimerNotifier() : super(const Duration(hours: 0, minutes: 36, seconds: 58)) {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.inSeconds > 0) {
        state = Duration(seconds: state.inSeconds - 1);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class FlashSaleTimer extends ConsumerWidget {
  const FlashSaleTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(flashSaleTimerProvider);

    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return Row(
      children: [
        const Icon(Icons.access_time, size: 16, color: Color(0xFF6B7280)),
        const SizedBox(width: 4),
        Text(
          '$hours:$minutes:$seconds',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }
}
