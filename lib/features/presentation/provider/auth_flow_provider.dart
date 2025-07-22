import 'package:flutter_riverpod/flutter_riverpod.dart';

// Auth Flow State
final authFlowProvider = StateNotifierProvider<AuthFlowNotifier, AuthFlowState>((ref) {
  return AuthFlowNotifier();
});

class AuthFlowNotifier extends StateNotifier<AuthFlowState> {
  AuthFlowNotifier() : super(const AuthFlowState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setRecoveryMethod(RecoveryMethod method) {
    state = state.copyWith(recoveryMethod: method);
  }

  void setRecoveryCode(String code) {
    state = state.copyWith(recoveryCode: code);
  }

  void incrementPasswordAttempts() {
    state = state.copyWith(passwordAttempts: state.passwordAttempts + 1);
  }

  void resetPasswordAttempts() {
    state = state.copyWith(passwordAttempts: 0);
  }

  void setUserName(String name) {
    state = state.copyWith(userName: name);
  }

  void reset() {
    state = const AuthFlowState();
  }
}

class AuthFlowState {
  final String email;
  final String password;
  final String userName;
  final RecoveryMethod recoveryMethod;
  final String recoveryCode;
  final int passwordAttempts;

  const AuthFlowState({
    this.email = '',
    this.password = '',
    this.userName = 'Romina',
    this.recoveryMethod = RecoveryMethod.sms,
    this.recoveryCode = '',
    this.passwordAttempts = 0,
  });

  AuthFlowState copyWith({
    String? email,
    String? password,
    String? userName,
    RecoveryMethod? recoveryMethod,
    String? recoveryCode,
    int? passwordAttempts,
  }) {
    return AuthFlowState(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      recoveryMethod: recoveryMethod ?? this.recoveryMethod,
      recoveryCode: recoveryCode ?? this.recoveryCode,
      passwordAttempts: passwordAttempts ?? this.passwordAttempts,
    );
  }
}

enum RecoveryMethod { sms, email }
