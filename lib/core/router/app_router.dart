import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentatiioin/pages/home_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/presentation/pages/create_account_page.dart';
import '../../features/presentation/pages/login_page.dart';
import '../../features/presentation/pages/max_attempts_page.dart';
import '../../features/presentation/pages/new_password_page.dart';
import '../../features/presentation/pages/password_recovery_page.dart';
import '../../features/presentation/pages/password_typing_page.dart';
import '../../features/presentation/pages/recovery_code_page.dart';
import '../../features/presentation/pages/wrong_password_page.dart';


final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/create-account',
        name: 'create-account',
        builder: (context, state) => const CreateAccountPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: '/password-typing',
        name: 'password-typing',
        builder: (context, state) => const PasswordTypingPage(),
      ),
      GoRoute(
        path: '/wrong-password',
        name: 'wrong-password',
        builder: (context, state) => const WrongPasswordPage(),
      ),
      GoRoute(
        path: '/password-recovery',
        name: 'password-recovery',
        builder: (context, state) => const PasswordRecoveryPage(),
      ),
      GoRoute(
        path: '/recovery-code',
        name: 'recovery-code',
        builder: (context, state) => const RecoveryCodePage(),
      ),
      GoRoute(
        path: '/new-password',
        name: 'new-password',
        builder: (context, state) => const NewPasswordPage(),
      ),
      GoRoute(
        path: '/max-attempts',
        name: 'max-attempts',
        builder: (context, state) => const MaxAttemptsPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),

    ],
  );
});
