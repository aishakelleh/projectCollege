// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LevelState {

 StatusGroup get status; List<ResponseLevel> get level; String? get errorMassage;
/// Create a copy of LevelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelStateCopyWith<LevelState> get copyWith => _$LevelStateCopyWithImpl<LevelState>(this as LevelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.level, level)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(level),errorMassage);

@override
String toString() {
  return 'LevelState(status: $status, level: $level, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $LevelStateCopyWith<$Res>  {
  factory $LevelStateCopyWith(LevelState value, $Res Function(LevelState) _then) = _$LevelStateCopyWithImpl;
@useResult
$Res call({
 StatusGroup status, List<ResponseLevel> level, String? errorMassage
});




}
/// @nodoc
class _$LevelStateCopyWithImpl<$Res>
    implements $LevelStateCopyWith<$Res> {
  _$LevelStateCopyWithImpl(this._self, this._then);

  final LevelState _self;
  final $Res Function(LevelState) _then;

/// Create a copy of LevelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? level = null,Object? errorMassage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusGroup,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as List<ResponseLevel>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LevelState].
extension LevelStatePatterns on LevelState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LevelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LevelState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LevelState value)  $default,){
final _that = this;
switch (_that) {
case _LevelState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LevelState value)?  $default,){
final _that = this;
switch (_that) {
case _LevelState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusGroup status,  List<ResponseLevel> level,  String? errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LevelState() when $default != null:
return $default(_that.status,_that.level,_that.errorMassage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusGroup status,  List<ResponseLevel> level,  String? errorMassage)  $default,) {final _that = this;
switch (_that) {
case _LevelState():
return $default(_that.status,_that.level,_that.errorMassage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusGroup status,  List<ResponseLevel> level,  String? errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _LevelState() when $default != null:
return $default(_that.status,_that.level,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _LevelState implements LevelState {
   _LevelState({this.status = StatusGroup.initial, final  List<ResponseLevel> level = const [], this.errorMassage}): _level = level;
  

@override@JsonKey() final  StatusGroup status;
 final  List<ResponseLevel> _level;
@override@JsonKey() List<ResponseLevel> get level {
  if (_level is EqualUnmodifiableListView) return _level;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_level);
}

@override final  String? errorMassage;

/// Create a copy of LevelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LevelStateCopyWith<_LevelState> get copyWith => __$LevelStateCopyWithImpl<_LevelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LevelState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._level, _level)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_level),errorMassage);

@override
String toString() {
  return 'LevelState(status: $status, level: $level, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$LevelStateCopyWith<$Res> implements $LevelStateCopyWith<$Res> {
  factory _$LevelStateCopyWith(_LevelState value, $Res Function(_LevelState) _then) = __$LevelStateCopyWithImpl;
@override @useResult
$Res call({
 StatusGroup status, List<ResponseLevel> level, String? errorMassage
});




}
/// @nodoc
class __$LevelStateCopyWithImpl<$Res>
    implements _$LevelStateCopyWith<$Res> {
  __$LevelStateCopyWithImpl(this._self, this._then);

  final _LevelState _self;
  final $Res Function(_LevelState) _then;

/// Create a copy of LevelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? level = null,Object? errorMassage = freezed,}) {
  return _then(_LevelState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusGroup,level: null == level ? _self._level : level // ignore: cast_nullable_to_non_nullable
as List<ResponseLevel>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
