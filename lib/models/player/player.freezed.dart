// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get maxbreak => throw _privateConstructorUsedError;
  int get frameswon => throw _privateConstructorUsedError;
  int get frameslost => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {int id,
      String name,
      int maxbreak,
      int frameswon,
      int frameslost,
      @Uint8ListConverter() Uint8List? picture});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxbreak = null,
    Object? frameswon = null,
    Object? frameslost = null,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxbreak: null == maxbreak
          ? _value.maxbreak
          : maxbreak // ignore: cast_nullable_to_non_nullable
              as int,
      frameswon: null == frameswon
          ? _value.frameswon
          : frameswon // ignore: cast_nullable_to_non_nullable
              as int,
      frameslost: null == frameslost
          ? _value.frameslost
          : frameslost // ignore: cast_nullable_to_non_nullable
              as int,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int maxbreak,
      int frameswon,
      int frameslost,
      @Uint8ListConverter() Uint8List? picture});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxbreak = null,
    Object? frameswon = null,
    Object? frameslost = null,
    Object? picture = freezed,
  }) {
    return _then(_$PlayerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxbreak: null == maxbreak
          ? _value.maxbreak
          : maxbreak // ignore: cast_nullable_to_non_nullable
              as int,
      frameswon: null == frameswon
          ? _value.frameswon
          : frameswon // ignore: cast_nullable_to_non_nullable
              as int,
      frameslost: null == frameslost
          ? _value.frameslost
          : frameslost // ignore: cast_nullable_to_non_nullable
              as int,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl extends _Player with DiagnosticableTreeMixin {
  _$PlayerImpl(
      {required this.id,
      required this.name,
      required this.maxbreak,
      required this.frameswon,
      required this.frameslost,
      @Uint8ListConverter() this.picture})
      : super._();

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int maxbreak;
  @override
  final int frameswon;
  @override
  final int frameslost;
  @override
  @Uint8ListConverter()
  final Uint8List? picture;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Player(id: $id, name: $name, maxbreak: $maxbreak, frameswon: $frameswon, frameslost: $frameslost, picture: $picture)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Player'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('maxbreak', maxbreak))
      ..add(DiagnosticsProperty('frameswon', frameswon))
      ..add(DiagnosticsProperty('frameslost', frameslost))
      ..add(DiagnosticsProperty('picture', picture));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.maxbreak, maxbreak) ||
                other.maxbreak == maxbreak) &&
            (identical(other.frameswon, frameswon) ||
                other.frameswon == frameswon) &&
            (identical(other.frameslost, frameslost) ||
                other.frameslost == frameslost) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, maxbreak, frameswon,
      frameslost, const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player extends Player {
  factory _Player(
      {required final int id,
      required final String name,
      required final int maxbreak,
      required final int frameswon,
      required final int frameslost,
      @Uint8ListConverter() final Uint8List? picture}) = _$PlayerImpl;
  _Player._() : super._();

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get maxbreak;
  @override
  int get frameswon;
  @override
  int get frameslost;
  @override
  @Uint8ListConverter()
  Uint8List? get picture;
  @override
  @JsonKey(ignore: true)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
