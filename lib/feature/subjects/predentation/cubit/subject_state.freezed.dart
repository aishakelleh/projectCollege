// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubjectState {

 StatusSubject get status; List<ResponseSubject> get subject; String? get errorMassage;
/// Create a copy of SubjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectStateCopyWith<SubjectState> get copyWith => _$SubjectStateCopyWithImpl<SubjectState>(this as SubjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.subject, subject)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(subject),errorMassage);

@override
String toString() {
  return 'SubjectState(status: $status, subject: $subject, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $SubjectStateCopyWith<$Res>  {
  factory $SubjectStateCopyWith(SubjectState value, $Res Function(SubjectState) _then) = _$SubjectStateCopyWithImpl;
@useResult
$Res call({
 StatusSubject status, List<ResponseSubject> subject, String? errorMassage
});




}
/// @nodoc
class _$SubjectStateCopyWithImpl<$Res>
    implements $SubjectStateCopyWith<$Res> {
  _$SubjectStateCopyWithImpl(this._self, this._then);

  final SubjectState _self;
  final $Res Function(SubjectState) _then;

/// Create a copy of SubjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? subject = null,Object? errorMassage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusSubject,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as List<ResponseSubject>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectState].
extension SubjectStatePatterns on SubjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectState value)  $default,){
final _that = this;
switch (_that) {
case _SubjectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectState value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusSubject status,  List<ResponseSubject> subject,  String? errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectState() when $default != null:
return $default(_that.status,_that.subject,_that.errorMassage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusSubject status,  List<ResponseSubject> subject,  String? errorMassage)  $default,) {final _that = this;
switch (_that) {
case _SubjectState():
return $default(_that.status,_that.subject,_that.errorMassage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusSubject status,  List<ResponseSubject> subject,  String? errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _SubjectState() when $default != null:
return $default(_that.status,_that.subject,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _SubjectState implements SubjectState {
   _SubjectState({this.status = StatusSubject.initial, final  List<ResponseSubject> subject = const [], this.errorMassage}): _subject = subject;
  

@override@JsonKey() final  StatusSubject status;
 final  List<ResponseSubject> _subject;
@override@JsonKey() List<ResponseSubject> get subject {
  if (_subject is EqualUnmodifiableListView) return _subject;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subject);
}

@override final  String? errorMassage;

/// Create a copy of SubjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectStateCopyWith<_SubjectState> get copyWith => __$SubjectStateCopyWithImpl<_SubjectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._subject, _subject)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_subject),errorMassage);

@override
String toString() {
  return 'SubjectState(status: $status, subject: $subject, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$SubjectStateCopyWith<$Res> implements $SubjectStateCopyWith<$Res> {
  factory _$SubjectStateCopyWith(_SubjectState value, $Res Function(_SubjectState) _then) = __$SubjectStateCopyWithImpl;
@override @useResult
$Res call({
 StatusSubject status, List<ResponseSubject> subject, String? errorMassage
});




}
/// @nodoc
class __$SubjectStateCopyWithImpl<$Res>
    implements _$SubjectStateCopyWith<$Res> {
  __$SubjectStateCopyWithImpl(this._self, this._then);

  final _SubjectState _self;
  final $Res Function(_SubjectState) _then;

/// Create a copy of SubjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? subject = null,Object? errorMassage = freezed,}) {
  return _then(_SubjectState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusSubject,subject: null == subject ? _self._subject : subject // ignore: cast_nullable_to_non_nullable
as List<ResponseSubject>,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
