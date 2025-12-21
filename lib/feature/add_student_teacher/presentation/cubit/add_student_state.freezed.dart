// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_student_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddStudentState {

 Status get status; List<ResponseStudent> get students; String? get errorMassage;
/// Create a copy of AddStudentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddStudentStateCopyWith<AddStudentState> get copyWith => _$AddStudentStateCopyWithImpl<AddStudentState>(this as AddStudentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddStudentState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.students, students)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(students),errorMassage);

@override
String toString() {
  return 'AddStudentState(status: $status, students: $students, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $AddStudentStateCopyWith<$Res>  {
  factory $AddStudentStateCopyWith(AddStudentState value, $Res Function(AddStudentState) _then) = _$AddStudentStateCopyWithImpl;
@useResult
$Res call({
 Status status, List<ResponseStudent> students, String? errorMassage
});




}
/// @nodoc
class _$AddStudentStateCopyWithImpl<$Res>
    implements $AddStudentStateCopyWith<$Res> {
  _$AddStudentStateCopyWithImpl(this._self, this._then);

  final AddStudentState _self;
  final $Res Function(AddStudentState) _then;

/// Create a copy of AddStudentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? students = null,Object? errorMassage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<ResponseStudent>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddStudentState].
extension AddStudentStatePatterns on AddStudentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddStudentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddStudentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddStudentState value)  $default,){
final _that = this;
switch (_that) {
case _AddStudentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddStudentState value)?  $default,){
final _that = this;
switch (_that) {
case _AddStudentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status status,  List<ResponseStudent> students,  String? errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddStudentState() when $default != null:
return $default(_that.status,_that.students,_that.errorMassage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status status,  List<ResponseStudent> students,  String? errorMassage)  $default,) {final _that = this;
switch (_that) {
case _AddStudentState():
return $default(_that.status,_that.students,_that.errorMassage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status status,  List<ResponseStudent> students,  String? errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _AddStudentState() when $default != null:
return $default(_that.status,_that.students,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _AddStudentState implements AddStudentState {
   _AddStudentState({this.status = Status.initial, final  List<ResponseStudent> students = const [], this.errorMassage}): _students = students;
  

@override@JsonKey() final  Status status;
 final  List<ResponseStudent> _students;
@override@JsonKey() List<ResponseStudent> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}

@override final  String? errorMassage;

/// Create a copy of AddStudentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddStudentStateCopyWith<_AddStudentState> get copyWith => __$AddStudentStateCopyWithImpl<_AddStudentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddStudentState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._students, _students)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_students),errorMassage);

@override
String toString() {
  return 'AddStudentState(status: $status, students: $students, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$AddStudentStateCopyWith<$Res> implements $AddStudentStateCopyWith<$Res> {
  factory _$AddStudentStateCopyWith(_AddStudentState value, $Res Function(_AddStudentState) _then) = __$AddStudentStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, List<ResponseStudent> students, String? errorMassage
});




}
/// @nodoc
class __$AddStudentStateCopyWithImpl<$Res>
    implements _$AddStudentStateCopyWith<$Res> {
  __$AddStudentStateCopyWithImpl(this._self, this._then);

  final _AddStudentState _self;
  final $Res Function(_AddStudentState) _then;

/// Create a copy of AddStudentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? students = null,Object? errorMassage = freezed,}) {
  return _then(_AddStudentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<ResponseStudent>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
