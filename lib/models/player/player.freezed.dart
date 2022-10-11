// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PlayerCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int maxbreak,
      int frameswon,
      int frameslost,
      @Uint8ListConverter() Uint8List? picture});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? maxbreak = freezed,
    Object? frameswon = freezed,
    Object? frameslost = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxbreak: maxbreak == freezed
          ? _value.maxbreak
          : maxbreak // ignore: cast_nullable_to_non_nullable
              as int,
      frameswon: frameswon == freezed
          ? _value.frameswon
          : frameswon // ignore: cast_nullable_to_non_nullable
              as int,
      frameslost: frameslost == freezed
          ? _value.frameslost
          : frameslost // ignore: cast_nullable_to_non_nullable
              as int,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$_PlayerCopyWith(_$_Player value, $Res Function(_$_Player) then) =
      __$$_PlayerCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int maxbreak,
      int frameswon,
      int frameslost,
      @Uint8ListConverter() Uint8List? picture});
}

/// @nodoc
class __$$_PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$$_PlayerCopyWith<$Res> {
  __$$_PlayerCopyWithImpl(_$_Player _value, $Res Function(_$_Player) _then)
      : super(_value, (v) => _then(v as _$_Player));

  @override
  _$_Player get _value => super._value as _$_Player;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? maxbreak = freezed,
    Object? frameswon = freezed,
    Object? frameslost = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_Player(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxbreak: maxbreak == freezed
          ? _value.maxbreak
          : maxbreak // ignore: cast_nullable_to_non_nullable
              as int,
      frameswon: frameswon == freezed
          ? _value.frameswon
          : frameswon // ignore: cast_nullable_to_non_nullable
              as int,
      frameslost: frameslost == freezed
          ? _value.frameslost
          : frameslost // ignore: cast_nullable_to_non_nullable
              as int,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Player extends _Player {
  _$_Player(
      {required this.id,
      required this.name,
      required this.maxbreak,
      required this.frameswon,
      required this.frameslost,
      @Uint8ListConverter() this.picture})
      : super._();

  factory _$_Player.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerFromJson(json);

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
  String toString() {
    return 'Player(id: $id, name: $name, maxbreak: $maxbreak, frameswon: $frameswon, frameslost: $frameslost, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Player &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.maxbreak, maxbreak) &&
            const DeepCollectionEquality().equals(other.frameswon, frameswon) &&
            const DeepCollectionEquality()
                .equals(other.frameslost, frameslost) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(maxbreak),
      const DeepCollectionEquality().hash(frameswon),
      const DeepCollectionEquality().hash(frameslost),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      __$$_PlayerCopyWithImpl<_$_Player>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerToJson(
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
      @Uint8ListConverter() final Uint8List? picture}) = _$_Player;
  _Player._() : super._();

  factory _Player.fromJson(Map<String, dynamic> json) = _$_Player.fromJson;

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
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      throw _privateConstructorUsedError;
}
