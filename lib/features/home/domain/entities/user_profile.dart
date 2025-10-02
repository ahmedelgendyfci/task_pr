import 'package:equatable/equatable.dart';

/// User profile entity representing the user's basic information
class UserProfile extends Equatable {
  final String id;
  final String name;
  final String? avatarUrl;
  final String? email;

  const UserProfile({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.email,
  });

  @override
  List<Object?> get props => [id, name, avatarUrl, email];

  @override
  String toString() => 'UserProfile(id: $id, name: $name, avatarUrl: $avatarUrl, email: $email)';
}
