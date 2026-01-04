// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupState {

 StatusGroup get status; List<ResponseGroup> get group; String? get errorMassage;
/// Create a copy of GroupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupStateCopyWith<GroupState> get copyWith => _$GroupStateCopyWithImpl<GroupState>(this as GroupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.group, group)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(group),errorMassage);

@override
String toString() {
  return 'GroupState(status: $status, group: $group, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $GroupStateCopyWith<$Res>  {
  factory $GroupStateCopyWith(GroupState value, $Res Function(GroupState) _then) = _$GroupStateCopyWithImpl;
@useResult
$Res call({
 StatusGroup status, List<ResponseGroup> group, String? errorMassage
});




}
/// @nodoc
class _$GroupStateCopyWithImpl<$Res>
    implements $GroupStateCopyWith<$Res> {
  _$GroupStateCopyWithImpl(this._self, this._then);

  final GroupState _self;
  final $Res Function(GroupState) _then;

/// Create a copy of GroupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? group = null,Object? errorMassage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusGroup,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as List<ResponseGroup>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupState].
extension GroupStatePatterns on GroupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupState value)  $default,){
final _that = this;
switch (_that) {
case _GroupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupState value)?  $default,){
final _that = this;
switch (_that) {
case _GroupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusGroup status,  List<ResponseGroup> group,  String? errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupState() when $default != null:
return $default(_that.status,_that.group,_that.errorMassage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusGroup status,  List<ResponseGroup> group,  String? errorMassage)  $default,) {final _that = this;
switch (_that) {
case _GroupState():
return $default(_that.status,_that.group,_that.errorMassage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusGroup status,  List<ResponseGroup> group,  String? errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _GroupState() when $default != null:
return $default(_that.status,_that.group,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _GroupState implements GroupState {
   _GroupState({this.status = StatusGroup.initial, final  List<ResponseGroup> group = const [], this.errorMassage}): _group = group;
  

@override@JsonKey() final  StatusGroup status;
 final  List<ResponseGroup> _group;
@override@JsonKey() List<ResponseGroup> get group {
  if (_group is EqualUnmodifiableListView) return _group;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_group);
}

@override final  String? errorMassage;

/// Create a copy of GroupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupStateCopyWith<_GroupState> get copyWith => __$GroupStateCopyWithImpl<_GroupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._group, _group)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_group),errorMassage);

@override
String toString() {
  return 'GroupState(status: $status, group: $group, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$GroupStateCopyWith<$Res> implements $GroupStateCopyWith<$Res> {
  factory _$GroupStateCopyWith(_GroupState value, $Res Function(_GroupState) _then) = __$GroupStateCopyWithImpl;
@override @useResult
$Res call({
 StatusGroup status, List<ResponseGroup> group, String? errorMassage
});




}
/// @nodoc
class __$GroupStateCopyWithImpl<$Res>
    implements _$GroupStateCopyWith<$Res> {
  __$GroupStateCopyWithImpl(this._self, this._then);

  final _GroupState _self;
  final $Res Function(_GroupState) _then;

/// Create a copy of GroupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? group = null,Object? errorMassage = freezed,}) {
  return _then(_GroupState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusGroup,group: null == group ? _self._group : group // ignore: cast_nullable_to_non_nullable
as List<ResponseGroup>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
