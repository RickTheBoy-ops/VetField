import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/local/hive_boxes.dart';
import '../providers/auth_provider.dart';
import 'package:flutter/services.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _crmvController = TextEditingController();
  bool _obscurePassword = true;
  int _loginTabIndex = 0;
  final _localAuth = LocalAuthentication();

  static TextInputFormatter _digitsOnly(int max) =>
      LengthLimitingTextInputFormatter(max);

  static final TextInputFormatter _cpfDigitsFormatter =
      FilteringTextInputFormatter.digitsOnly;

  static final TextInputFormatter _crmvAllowFormatter =
      FilteringTextInputFormatter.allow(RegExp('[0-9A-Za-z-]'));

  static final TextInputFormatter _upperCaseFormatter =
      TextInputFormatter.withFunction((oldValue, newValue) {
        return newValue.copyWith(text: newValue.text.toUpperCase());
      });

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _cpfController.dispose();
    _crmvController.dispose();
    super.dispose();
  }

  void _login() {
    debugPrint('Login button pressed. Tab index: $_loginTabIndex');
    if (_formKey.currentState!.validate()) {
      debugPrint('Form is valid. Attempting login...');
      if (_loginTabIndex == 0) {
        debugPrint(
          'Email: ${_emailController.text}, Password length: ${_passwordController.text.length}',
        );
        ref
            .read(authControllerProvider.notifier)
            .login(_emailController.text.trim(), _passwordController.text);
      } else if (_loginTabIndex == 1) {
        ref
            .read(authControllerProvider.notifier)
            .loginWithCpf(_cpfController.text.trim(), _passwordController.text);
      } else {
        ref
            .read(authControllerProvider.notifier)
            .loginWithCrmv(
              _crmvController.text.trim(),
              _passwordController.text,
            );
      }
    } else {
      debugPrint('Form validation failed');
    }
  }

  Future<void> _tryBiometricLogin() async {
    final canCheck = await _localAuth.canCheckBiometrics;
    final isSupported = await _localAuth.isDeviceSupported();
    if (!canCheck || !isSupported) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Biometria não disponível neste dispositivo'),
          ),
        );
      }
      return;
    }
    final didAuth = await _localAuth.authenticate(
      localizedReason: 'Autenticar para entrar rapidamente',
      options: const AuthenticationOptions(biometricOnly: true),
    );
    if (!didAuth) return;
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      if (!mounted) return;
      context.go('/home');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sessão não encontrada. Faça login uma vez.'),
          ),
        );
      }
    }
  }

  void _goToRegister() {
    context.go('/register');
  }

  @override
  Widget build(BuildContext context) {
    // Listener para reagir ao estado do login (Sucesso ou Erro)
    ref.listen(authControllerProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        // Atualizar first_install
        HiveBoxes.getUserPreferencesBox().put('first_install', false);
        // Login com sucesso
        context.go('/home');
      } else if (next is AsyncError) {
        // Erro no login
        debugPrint('Login Error: ${next.error}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } else if (next is AsyncData && next.value != null) {
        // Login com sucesso
        debugPrint('Login Success! User: ${next.value!.id}');
        HiveBoxes.getUserPreferencesBox().put('first_install', false);
        // Forçar navegação direta
        context.go('/home');
      }
    });

    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo/Title
                  const Text(
                    'Bem-vindo ao\nVetField! 👋',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Entre para continuar',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 40),

                  SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _loginTabIndex = 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _loginTabIndex == 0
                                    ? AppColors.primary.withValues(alpha: 0.1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _loginTabIndex == 0
                                      ? AppColors.primary
                                      : AppColors.border,
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: _loginTabIndex == 0
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _loginTabIndex = 1),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _loginTabIndex == 1
                                    ? AppColors.primary.withValues(alpha: 0.1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _loginTabIndex == 1
                                      ? AppColors.primary
                                      : AppColors.border,
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'CPF',
                                style: TextStyle(
                                  color: _loginTabIndex == 1
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _loginTabIndex = 2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _loginTabIndex == 2
                                    ? AppColors.primary.withValues(alpha: 0.1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _loginTabIndex == 2
                                      ? AppColors.primary
                                      : AppColors.border,
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'CRMV',
                                style: TextStyle(
                                  color: _loginTabIndex == 2
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  if (_loginTabIndex == 0)
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: !isLoading,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'seu@email.com',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (value) {
                        if (_loginTabIndex != 0) return null;
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu email';
                        }
                        if (!value.contains('@')) {
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),
                  if (_loginTabIndex == 1)
                    TextFormField(
                      controller: _cpfController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [_cpfDigitsFormatter, _digitsOnly(11)],
                      enabled: !isLoading,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        hintText: '00000000000',
                        prefixIcon: const Icon(Icons.perm_identity),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (value) {
                        if (_loginTabIndex != 1) return null;
                        if (value == null || value.isEmpty) {
                          return 'Informe o CPF';
                        }
                        final v = value.replaceAll(RegExp(r'\D'), '');
                        if (v.length != 11) {
                          return 'CPF inválido';
                        }
                        return null;
                      },
                    ),
                  if (_loginTabIndex == 2)
                    TextFormField(
                      controller: _crmvController,
                      enabled: !isLoading,
                      inputFormatters: [
                        _crmvAllowFormatter,
                        _upperCaseFormatter,
                        _digitsOnly(9),
                      ],
                      decoration: InputDecoration(
                        labelText: 'CRMV',
                        hintText: '12345-UF',
                        prefixIcon: const Icon(Icons.badge_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (value) {
                        if (_loginTabIndex != 2) return null;
                        if (value == null || value.isEmpty) {
                          return 'Informe o CRMV';
                        }
                        final regex = RegExp(r'^[0-9]{3,6}-[A-Za-z]{2}$');
                        if (!regex.hasMatch(value)) {
                          return 'Formato CRMV inválido';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    enabled: !isLoading,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: '••••••••',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      if (value.length < 6) {
                        return 'Senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              final controller = TextEditingController();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Recuperar senha'),
                                    content: TextField(
                                      controller: controller,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ref
                                              .read(
                                                authControllerProvider.notifier,
                                              )
                                              .sendPasswordReset(
                                                controller.text.trim(),
                                              );
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Se o email existir, enviaremos instruções.',
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text('Enviar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                      child: const Text(
                        'Esqueci a senha',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: isLoading ? null : _tryBiometricLogin,
                      icon: const Icon(Icons.fingerprint),
                      label: const Text('Entrar com biometria'),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Register Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta? ',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      TextButton(
                        onPressed: isLoading ? null : _goToRegister,
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
