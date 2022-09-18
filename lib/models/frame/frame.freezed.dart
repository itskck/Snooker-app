// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Frame _$FrameFromJson(Map<String, dynamic> json) {
  return _Frame.fromJson(json);
}

/// @nodoc
mixin _$Frame {
  int get player1Id => throw _privateConstructorUsedError;
  int get player2Id => throw _privateConstructorUsedError;
  List<String?> get player1Scores => throw _privateConstructorUsedError;
  set player1Scores(List<String?> value) => throw _privateConstructorUsedError;
  List<String?> get player2Scores => throw _privateConstructorUsedError;
  set player2Scores(List<String?> value) => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  set isFinished(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FrameCopyWith<Frame> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FrameCopyWith<$Res> {
  factory $FrameCopyWith(Frame value, $Res Function(Frame) then) =
      _$FrameCopyWithImpl<$Res>;
  $Res call(
      {int player1Id,
      int player2Id,
      List<String?> player1Scores,
      List<String?> player2Scores,
      bool isFinished});
}

/// @nodoc
class _$FrameCopyWithImpl<$Res> implements $FrameCopyWith<$Res> {
  _$FrameCopyWithImpl(this._value, this._then);

  final Frame _value;
  // ignore: unused_field
  final $Res Function(Frame) _then;

  @override
  $Res call({
    Object? player1Id = freezed,
    Object? player2Id = freezed,
    Object? player1Scores = freezed,
    Object? player2Scores = freezed,
    Object? isFinished = freezed,
  }) {
    return _then(_value.copyWith(
      player1Id: player1Id == freezed
          ? _value.player1Id
          : player1Id // ignore: cast_nullable_to_non_nullable
              as int,
      player2Id: player2Id == freezed
          ? _value.player2Id
          : player2Id // ignore: cast_nullable_to_non_nullable
              as int,
      player1Scores: player1Scores == freezed
          ? _value.player1Scores
          : player1Scores // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      player2Scores: player2Scores == freezed
          ? _value.player2Scores
          : player2Scores // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      isFinished: isFinished == freezed
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FrameCopyWith<$Res> implements $FrameCopyWith<$Res> {
  factory _$$_FrameCopyWith(_$_Frame value, $Res Function(_$_Frame) then) =
      __$$_FrameCopyWithImpl<$Res>;
  @override
  $Res call(
      {int player1Id,
      int player2Id,
      List<String?> player1Scores,
      List<String?> player2Scores,
      bool isFinished});
}

/// @nodoc
class __$$_FrameCopyWithImpl<$Res> extends _$FrameCopyWithImpl<$Res>
    implements _$$_FrameCopyWith<$Res> {
  __$$_FrameCopyWithImpl(_$_Frame _value, $Res Function(_$_Frame) _then)
      : super(_value, (v) => _then(v as _$_Frame));

  @override
  _$_Frame get _value => super._value as _$_Frame;

  @override
  $Res call({
    Object? player1Id = freezed,
    Object? player2Id = freezed,
    Object? player1Scores = freezed,
    Object? player2Scores = freezed,
    Object? isFinished = freezed,
  }) {
    return _then(_$_Frame(
      player1Id: player1Id == freezed
          ? _value.player1Id
          : player1Id // ignore: cast_nullable_to_non_nullable
              as int,
      player2Id: player2Id == freezed
          ? _value.player2Id
          : player2Id // ignore: cast_nullable_to_non_nullable
              as int,
      player1Scores: player1Scores == freezed
          ? _value.player1Scores
          : player1Scores // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      player2Scores: player2Scores == freezed
          ? _value.player2Scores
          : player2Scores // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      isFinished: isFinished == freezed
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Frame with DiagnosticableTreeMixin implements _Frame {
  _$_Frame(
      {required this.player1Id,
      required this.player2Id,
      this.player1Scores = const [],
      this.player2Scores = const [],
      this.isFinished = false});

  factory _$_Frame.fromJson(Map<String, dynamic> json) =>
      _$$_FrameFromJson(json);

  @override
  final int player1Id;
  @override
  final int player2Id;
  @override
  @JsonKey()
  List<String?> player1Scores;
  @override
  @JsonKey()
  List<String?> player2Scores;
  @override
  @JsonKey()
  bool isFinished;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Frame(player1Id: $player1Id, player2Id: $player2Id, player1Scores: $player1Scores, player2Scores: $player2Scores, isFinished: $isFinished)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Frame'))
      ..add(DiagnosticsProperty('player1Id', player1Id))
      ..add(DiagnosticsProperty('player2Id', player2Id))
      ..add(DiagnosticsProperty('player1Scores', player1Scores))
      ..add(DiagnosticsProperty('player2Scores', player2Scores))
      ..add(DiagnosticsProperty('isFinished', isFinished));
  }

  @JsonKey(ignore: true)
  @override
  _$$_FrameCopyWith<_$_Frame> get copyWith =>
      __$$_FrameCopyWithImpl<_$_Frame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FrameToJson(
      this,
    );
  }
}

abstract class _Frame implements Frame {
  factory _Frame(
      {required final int player1Id,
      required final int player2Id,
      List<String?> player1Scores,
      List<String?> player2Scores,
      bool isFinished}) = _$_Frame;

  factory _Frame.fromJson(Map<String, dynamic> json) = _$_Frame.fromJson;

  @override
  int get player1Id;
  @override
  int get player2Id;
  @override
  List<String?> get player1Scores;
  set player1Scores(List<String?> value);
  @override
  List<String?> get player2Scores;
  set player2Scores(List<String?> value);
  @override
  bool get isFinished;
  set isFinished(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_FrameCopyWith<_$_Frame> get copyWith =>
      throw _privateConstructorUsedError;
}
