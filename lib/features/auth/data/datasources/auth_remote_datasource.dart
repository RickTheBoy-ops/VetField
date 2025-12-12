import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> loginByCpf(String cpf, String password);
  Future<UserModel> loginByCrmv(String crmv, String password);
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    required UserType type,
    String? crmv,
    String? cpf,
  });
  Future<UserModel?> getCurrentUser();
  Future<void> logout();
  Future<void> resetPassword(String email);
  Future<UserModel> updateProfile({
    String? name,
    String? avatarUrl,
    String? crmv,
    String? cpf,
  });
  Future<void> saveFcmToken(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('Falha no login: Usuário não encontrado');
    }

    // Buscar dados adicionais do perfil na tabela 'profiles'
    // Usar maybeSingle() em vez de single() para evitar crash se o perfil ainda não existir (race condition no registro)
    final profileResponse = await supabaseClient
        .from('profiles')
        .select()
        .eq('id', response.user!.id)
        .maybeSingle();
    
    // Se não tiver perfil, usar dados básicos do user metadata ou defaults
    final profile = profileResponse ?? {};

    return UserModel(
      id: response.user!.id,
      email: response.user!.email ?? '',
      name: profile['name'] ?? response.user!.userMetadata?['name'] ?? '',
      type: _parseUserType(profile['type'] ?? response.user!.userMetadata?['type']),
      crmv: profile['crmv'],
      cpf: profile['cpf'],
      avatarUrl: profile['avatar_url'],
    );
  }

  @override
  Future<UserModel> loginByCpf(String cpf, String password) async {
    final profile = await supabaseClient
        .from('profiles')
        .select('id,email')
        .eq('cpf', cpf)
        .single();
    final email = profile['email'] as String?;
    if (email == null || email.isEmpty) {
      throw Exception('Perfil não encontrado para CPF informado');
    }
    return login(email, password);
  }

  @override
  Future<UserModel> loginByCrmv(String crmv, String password) async {
    final profile = await supabaseClient
        .from('profiles')
        .select('id,email,type')
        .eq('crmv', crmv)
        .eq('type', 'vet')
        .single();
    final email = profile['email'] as String?;
    if (email == null || email.isEmpty) {
      throw Exception('Perfil não encontrado para CRMV informado');
    }
    return login(email, password);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    required UserType type,
    String? crmv,
    String? cpf,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'type': type.name, // 'vet' ou 'owner'
        'crmv': crmv,
        'cpf': cpf,
      },
    );

    if (response.user == null) {
      throw Exception('Falha no registro');
    }

    await supabaseClient.from('profiles').upsert({
      'id': response.user!.id,
      'email': email,
      'name': name,
      'type': type.name,
      'crmv': crmv,
      'cpf': cpf,
    });

    // O trigger no Supabase deve criar o registro na tabela profiles automaticamente
    // Mas para garantir consistência imediata no retorno:
    return UserModel(
      id: response.user!.id,
      email: email,
      name: name,
      type: type,
      crmv: crmv,
      cpf: cpf,
    );
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = supabaseClient.auth.currentUser;
    if (user == null) return null;

    try {
      final profile = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      return UserModel(
        id: user.id,
        email: user.email ?? '',
        name: profile['name'] ?? '',
        type: _parseUserType(profile['type']),
        crmv: profile['crmv'],
        cpf: profile['cpf'],
        avatarUrl: profile['avatar_url'],
      );
    } catch (e) {
      // Se falhar ao buscar perfil, pode ser que a sessão esteja inválida ou perfil incompleto
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    await supabaseClient.auth.resetPasswordForEmail(email);
  }

  @override
  Future<UserModel> updateProfile({
    String? name,
    String? avatarUrl,
    String? crmv,
    String? cpf,
  }) async {
    final user = supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('Usuário não autenticado');
    }
    final update = {
      if (name != null) 'name': name,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (crmv != null) 'crmv': crmv,
      if (cpf != null) 'cpf': cpf,
    };
    if (update.isEmpty) {
      final current = await getCurrentUser();
      if (current == null) throw Exception('Perfil não encontrado');
      return UserModel.fromEntity(current);
    }
    await supabaseClient.from('profiles').update(update).eq('id', user.id);
    final profile = await supabaseClient
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();
    return UserModel(
      id: user.id,
      email: user.email ?? '',
      name: profile['name'] ?? '',
      type: _parseUserType(profile['type']),
      crmv: profile['crmv'],
      cpf: profile['cpf'],
      avatarUrl: profile['avatar_url'],
    );
  }

  UserType _parseUserType(String? type) {
    if (type == 'vet') return UserType.vet;
    return UserType.owner;
  }

  @override
  Future<void> saveFcmToken(String token) async {
    final user = supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Usuário não autenticado');
    
    await supabaseClient.from('profiles').update({
      'fcm_token': token,
    }).eq('id', user.id);
  }
}
