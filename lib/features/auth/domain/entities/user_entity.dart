import 'package:equatable/equatable.dart';

enum UserType { vet, owner }

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final UserType type;
  final String? avatarUrl;
  
  // Campos específicos de Vet (poderiam estar em uma subclass ou tabela separada)
  final String? crmv;
  
  // Campos específicos de Owner
  final String? cpf;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.type,
    this.avatarUrl,
    this.crmv,
    this.cpf,
  });

  @override
  List<Object?> get props => [id, email, name, type, avatarUrl, crmv, cpf];
}
