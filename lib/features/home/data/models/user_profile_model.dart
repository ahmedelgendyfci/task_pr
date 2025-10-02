import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_profile.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

/// Data model for user profile, extends the domain entity
@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String id,
    required String name,
    String? avatarUrl,
    String? email,
  }) = _UserProfileModel;

  const UserProfileModel._();

  /// Create from domain entity
  factory UserProfileModel.fromEntity(UserProfile profile) {
    return UserProfileModel(
      id: profile.id,
      name: profile.name,
      avatarUrl: profile.avatarUrl,
      email: profile.email,
    );
  }

  /// Convert to domain entity
  UserProfile toEntity() {
    return UserProfile(
      id: id,
      name: name,
      avatarUrl: avatarUrl,
      email: email,
    );
  }

  /// Create from JSON
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  /// Convert to JSON
  Map<String, dynamic> toJson() => _$$UserProfileModelImplToJson(this as _$UserProfileModelImpl);
}
