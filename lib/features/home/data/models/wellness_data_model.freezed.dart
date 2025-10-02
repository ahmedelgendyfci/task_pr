// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellness_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WellnessDataModel _$WellnessDataModelFromJson(Map<String, dynamic> json) {
  return _WellnessDataModel.fromJson(json);
}

/// @nodoc
mixin _$WellnessDataModel {
  UserProfileModel get userProfile => throw _privateConstructorUsedError;
  double get wellnessPercentage => throw _privateConstructorUsedError;
  List<VitalMetricModel> get vitals => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  /// Serializes this WellnessDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WellnessDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WellnessDataModelCopyWith<WellnessDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WellnessDataModelCopyWith<$Res> {
  factory $WellnessDataModelCopyWith(
    WellnessDataModel value,
    $Res Function(WellnessDataModel) then,
  ) = _$WellnessDataModelCopyWithImpl<$Res, WellnessDataModel>;
  @useResult
  $Res call({
    UserProfileModel userProfile,
    double wellnessPercentage,
    List<VitalMetricModel> vitals,
    DateTime lastUpdated,
    bool isConnected,
  });

  $UserProfileModelCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$WellnessDataModelCopyWithImpl<$Res, $Val extends WellnessDataModel>
    implements $WellnessDataModelCopyWith<$Res> {
  _$WellnessDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WellnessDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? wellnessPercentage = null,
    Object? vitals = null,
    Object? lastUpdated = null,
    Object? isConnected = null,
  }) {
    return _then(
      _value.copyWith(
            userProfile: null == userProfile
                ? _value.userProfile
                : userProfile // ignore: cast_nullable_to_non_nullable
                      as UserProfileModel,
            wellnessPercentage: null == wellnessPercentage
                ? _value.wellnessPercentage
                : wellnessPercentage // ignore: cast_nullable_to_non_nullable
                      as double,
            vitals: null == vitals
                ? _value.vitals
                : vitals // ignore: cast_nullable_to_non_nullable
                      as List<VitalMetricModel>,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isConnected: null == isConnected
                ? _value.isConnected
                : isConnected // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of WellnessDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res> get userProfile {
    return $UserProfileModelCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WellnessDataModelImplCopyWith<$Res>
    implements $WellnessDataModelCopyWith<$Res> {
  factory _$$WellnessDataModelImplCopyWith(
    _$WellnessDataModelImpl value,
    $Res Function(_$WellnessDataModelImpl) then,
  ) = __$$WellnessDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserProfileModel userProfile,
    double wellnessPercentage,
    List<VitalMetricModel> vitals,
    DateTime lastUpdated,
    bool isConnected,
  });

  @override
  $UserProfileModelCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$$WellnessDataModelImplCopyWithImpl<$Res>
    extends _$WellnessDataModelCopyWithImpl<$Res, _$WellnessDataModelImpl>
    implements _$$WellnessDataModelImplCopyWith<$Res> {
  __$$WellnessDataModelImplCopyWithImpl(
    _$WellnessDataModelImpl _value,
    $Res Function(_$WellnessDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WellnessDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? wellnessPercentage = null,
    Object? vitals = null,
    Object? lastUpdated = null,
    Object? isConnected = null,
  }) {
    return _then(
      _$WellnessDataModelImpl(
        userProfile: null == userProfile
            ? _value.userProfile
            : userProfile // ignore: cast_nullable_to_non_nullable
                  as UserProfileModel,
        wellnessPercentage: null == wellnessPercentage
            ? _value.wellnessPercentage
            : wellnessPercentage // ignore: cast_nullable_to_non_nullable
                  as double,
        vitals: null == vitals
            ? _value._vitals
            : vitals // ignore: cast_nullable_to_non_nullable
                  as List<VitalMetricModel>,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isConnected: null == isConnected
            ? _value.isConnected
            : isConnected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WellnessDataModelImpl extends _WellnessDataModel {
  const _$WellnessDataModelImpl({
    required this.userProfile,
    required this.wellnessPercentage,
    required final List<VitalMetricModel> vitals,
    required this.lastUpdated,
    required this.isConnected,
  }) : _vitals = vitals,
       super._();

  factory _$WellnessDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WellnessDataModelImplFromJson(json);

  @override
  final UserProfileModel userProfile;
  @override
  final double wellnessPercentage;
  final List<VitalMetricModel> _vitals;
  @override
  List<VitalMetricModel> get vitals {
    if (_vitals is EqualUnmodifiableListView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vitals);
  }

  @override
  final DateTime lastUpdated;
  @override
  final bool isConnected;

  @override
  String toString() {
    return 'WellnessDataModel(userProfile: $userProfile, wellnessPercentage: $wellnessPercentage, vitals: $vitals, lastUpdated: $lastUpdated, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WellnessDataModelImpl &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.wellnessPercentage, wellnessPercentage) ||
                other.wellnessPercentage == wellnessPercentage) &&
            const DeepCollectionEquality().equals(other._vitals, _vitals) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userProfile,
    wellnessPercentage,
    const DeepCollectionEquality().hash(_vitals),
    lastUpdated,
    isConnected,
  );

  /// Create a copy of WellnessDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WellnessDataModelImplCopyWith<_$WellnessDataModelImpl> get copyWith =>
      __$$WellnessDataModelImplCopyWithImpl<_$WellnessDataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WellnessDataModelImplToJson(this);
  }
}

abstract class _WellnessDataModel extends WellnessDataModel {
  const factory _WellnessDataModel({
    required final UserProfileModel userProfile,
    required final double wellnessPercentage,
    required final List<VitalMetricModel> vitals,
    required final DateTime lastUpdated,
    required final bool isConnected,
  }) = _$WellnessDataModelImpl;
  const _WellnessDataModel._() : super._();

  factory _WellnessDataModel.fromJson(Map<String, dynamic> json) =
      _$WellnessDataModelImpl.fromJson;

  @override
  UserProfileModel get userProfile;
  @override
  double get wellnessPercentage;
  @override
  List<VitalMetricModel> get vitals;
  @override
  DateTime get lastUpdated;
  @override
  bool get isConnected;

  /// Create a copy of WellnessDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WellnessDataModelImplCopyWith<_$WellnessDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
