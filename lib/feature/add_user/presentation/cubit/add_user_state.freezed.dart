// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddUserState {

 Status get status; List<ResponseUser> get user; List<ResponseUser> get teachers; List<ResponseUser> get students; String? get errorMassage;
/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddUserStateCopyWith<AddUserState> get copyWith => _$AddUserStateCopyWithImpl<AddUserState>(this as AddUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUserState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.user, user)&&const DeepCollectionEquality().equals(other.teachers, teachers)&&const DeepCollectionEquality().equals(other.students, students)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(user),const DeepCollectionEquality().hash(teachers),const DeepCollectionEquality().hash(students),errorMassage);

@override
String toString() {
  return 'AddUserState(status: $status, user: $user, teachers: $teachers, students: $students, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $AddUserStateCopyWith<$Res>  {
  factory $AddUserStateCopyWith(AddUserState value, $Res Function(AddUserState) _then) = _$AddUserStateCopyWithImpl;
@useResult
$Res call({
 Status status, List<ResponseUser> user, List<ResponseUser> teachers, List<ResponseUser> students, String? errorMassage
});




}
/// @nodoc
class _$AddUserStateCopyWithImpl<$Res>
    implements $AddUserStateCopyWith<$Res> {
  _$AddUserStateCopyWithImpl(this._self, this._then);

  final AddUserState _self;
  final $Res Function(AddUserState) _then;

/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? user = null,Object? teachers = null,Object? students = null,Object? errorMassage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as List<ResponseUser>,teachers: null == teachers ? _self.teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<ResponseUser>,students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<ResponseUser>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddUserState].
extension AddUserStatePatterns on AddUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddUserState value)  $default,){
final _that = this;
switch (_that) {
case _AddUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddUserState value)?  $default,){
final _that = this;
switch (_that) {
case _AddUserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status status,  List<ResponseUser> user,  List<ResponseUser> teachers,  List<ResponseUser> students,  String? errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddUserState() when $default != null:
return $default(_that.status,_that.user,_that.teachers,_that.students,_that.errorMassage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status status,  List<ResponseUser> user,  List<ResponseUser> teachers,  List<ResponseUser> students,  String? errorMassage)  $default,) {final _that = this;
switch (_that) {
case _AddUserState():
return $default(_that.status,_that.user,_that.teachers,_that.students,_that.errorMassage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status status,  List<ResponseUser> user,  List<ResponseUser> teachers,  List<ResponseUser> students,  String? errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _AddUserState() when $default != null:
return $default(_that.status,_that.user,_that.teachers,_that.students,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _AddUserState implements AddUserState {
   _AddUserState({this.status = Status.initial, final  List<ResponseUser> user = const [], final  List<ResponseUser> teachers = const [], final  List<ResponseUser> students = const [], this.errorMassage}): _user = user,_teachers = teachers,_students = students;
  

@override@JsonKey() final  Status status;
 final  List<ResponseUser> _user;
@override@JsonKey() List<ResponseUser> get user {
  if (_user is EqualUnmodifiableListView) return _user;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_user);
}

 final  List<ResponseUser> _teachers;
@override@JsonKey() List<ResponseUser> get teachers {
  if (_teachers is EqualUnmodifiableListView) return _teachers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teachers);
}

 final  List<ResponseUser> _students;
@override@JsonKey() List<ResponseUser> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}

@override final  String? errorMassage;

/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddUserStateCopyWith<_AddUserState> get copyWith => __$AddUserStateCopyWithImpl<_AddUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddUserState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._user, _user)&&const DeepCollectionEquality().equals(other._teachers, _teachers)&&const DeepCollectionEquality().equals(other._students, _students)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_user),const DeepCollectionEquality().hash(_teachers),const DeepCollectionEquality().hash(_students),errorMassage);

@override
String toString() {
  return 'AddUserState(status: $status, user: $user, teachers: $teachers, students: $students, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$AddUserStateCopyWith<$Res> implements $AddUserStateCopyWith<$Res> {
  factory _$AddUserStateCopyWith(_AddUserState value, $Res Function(_AddUserState) _then) = __$AddUserStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, List<ResponseUser> user, List<ResponseUser> teachers, List<ResponseUser> students, String? errorMassage
});




}
/// @nodoc
class __$AddUserStateCopyWithImpl<$Res>
    implements _$AddUserStateCopyWith<$Res> {
  __$AddUserStateCopyWithImpl(this._self, this._then);

  final _AddUserState _self;
  final $Res Function(_AddUserState) _then;

/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? user = null,Object? teachers = null,Object? students = null,Object? errorMassage = freezed,}) {
  return _then(_AddUserState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,user: null == user ? _self._user : user // ignore: cast_nullable_to_non_nullable
as List<ResponseUser>,teachers: null == teachers ? _self._teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<ResponseUser>,students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<ResponseUser>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
