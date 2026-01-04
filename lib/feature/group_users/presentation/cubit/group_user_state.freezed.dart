// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupUserState {

 StatusGroupUser get status; List<ResponseRelation> get relation;//post,put,
 List<ResponseGroupUsers> get users;//get,
 String? get errorMassage;
/// Create a copy of GroupUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupUserStateCopyWith<GroupUserState> get copyWith => _$GroupUserStateCopyWithImpl<GroupUserState>(this as GroupUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupUserState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.relation, relation)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(relation),const DeepCollectionEquality().hash(users),errorMassage);

@override
String toString() {
  return 'GroupUserState(status: $status, relation: $relation, users: $users, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $GroupUserStateCopyWith<$Res>  {
  factory $GroupUserStateCopyWith(GroupUserState value, $Res Function(GroupUserState) _then) = _$GroupUserStateCopyWithImpl;
@useResult
$Res call({
 StatusGroupUser status, List<ResponseRelation> relation, List<ResponseGroupUsers> users, String? errorMassage
});




}
/// @nodoc
class _$GroupUserStateCopyWithImpl<$Res>
    implements $GroupUserStateCopyWith<$Res> {
  _$GroupUserStateCopyWithImpl(this._self, this._then);

  final GroupUserState _self;
  final $Res Function(GroupUserState) _then;

/// Create a copy of GroupUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? relation = null,Object? users = null,Object? errorMassage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusGroupUser,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as List<ResponseRelation>,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<ResponseGroupUsers>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupUserState].
extension GroupUserStatePatterns on GroupUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupUserState value)  $default,){
final _that = this;
switch (_that) {
case _GroupUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupUserState value)?  $default,){
final _that = this;
switch (_that) {
case _GroupUserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusGroupUser status,  List<ResponseRelation> relation,  List<ResponseGroupUsers> users,  String? errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupUserState() when $default != null:
return $default(_that.status,_that.relation,_that.users,_that.errorMassage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusGroupUser status,  List<ResponseRelation> relation,  List<ResponseGroupUsers> users,  String? errorMassage)  $default,) {final _that = this;
switch (_that) {
case _GroupUserState():
return $default(_that.status,_that.relation,_that.users,_that.errorMassage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusGroupUser status,  List<ResponseRelation> relation,  List<ResponseGroupUsers> users,  String? errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _GroupUserState() when $default != null:
return $default(_that.status,_that.relation,_that.users,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _GroupUserState implements GroupUserState {
   _GroupUserState({this.status = StatusGroupUser.initial, final  List<ResponseRelation> relation = const [], final  List<ResponseGroupUsers> users = const [], this.errorMassage}): _relation = relation,_users = users;
  

@override@JsonKey() final  StatusGroupUser status;
 final  List<ResponseRelation> _relation;
@override@JsonKey() List<ResponseRelation> get relation {
  if (_relation is EqualUnmodifiableListView) return _relation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relation);
}

//post,put,
 final  List<ResponseGroupUsers> _users;
//post,put,
@override@JsonKey() List<ResponseGroupUsers> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

//get,
@override final  String? errorMassage;

/// Create a copy of GroupUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupUserStateCopyWith<_GroupUserState> get copyWith => __$GroupUserStateCopyWithImpl<_GroupUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupUserState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._relation, _relation)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_relation),const DeepCollectionEquality().hash(_users),errorMassage);

@override
String toString() {
  return 'GroupUserState(status: $status, relation: $relation, users: $users, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$GroupUserStateCopyWith<$Res> implements $GroupUserStateCopyWith<$Res> {
  factory _$GroupUserStateCopyWith(_GroupUserState value, $Res Function(_GroupUserState) _then) = __$GroupUserStateCopyWithImpl;
@override @useResult
$Res call({
 StatusGroupUser status, List<ResponseRelation> relation, List<ResponseGroupUsers> users, String? errorMassage
});




}
/// @nodoc
class __$GroupUserStateCopyWithImpl<$Res>
    implements _$GroupUserStateCopyWith<$Res> {
  __$GroupUserStateCopyWithImpl(this._self, this._then);

  final _GroupUserState _self;
  final $Res Function(_GroupUserState) _then;

/// Create a copy of GroupUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? relation = null,Object? users = null,Object? errorMassage = freezed,}) {
  return _then(_GroupUserState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusGroupUser,relation: null == relation ? _self._relation : relation // ignore: cast_nullable_to_non_nullable
as List<ResponseRelation>,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<ResponseGroupUsers>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
