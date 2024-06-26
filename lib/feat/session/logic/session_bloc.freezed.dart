// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SessionModel? data, List<OrderModel> orders)
        success,
    required TResult Function(NetworkException exception) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult? Function(NetworkException exception)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult Function(NetworkException exception)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'SessionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SessionModel? data, List<OrderModel> orders)
        success,
    required TResult Function(NetworkException exception) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult? Function(NetworkException exception)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult Function(NetworkException exception)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements SessionState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<$Res> {
  factory _$$SuccessStateImplCopyWith(
          _$SuccessStateImpl value, $Res Function(_$SuccessStateImpl) then) =
      __$$SuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionModel? data, List<OrderModel> orders});
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
      _$SuccessStateImpl _value, $Res Function(_$SuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? orders = null,
  }) {
    return _then(_$SuccessStateImpl(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SessionModel?,
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ));
  }
}

/// @nodoc

class _$SuccessStateImpl implements _SuccessState {
  const _$SuccessStateImpl(this.data, final List<OrderModel> orders)
      : _orders = orders;

  @override
  final SessionModel? data;
  final List<OrderModel> _orders;
  @override
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'SessionState.success(data: $data, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, data, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      __$$SuccessStateImplCopyWithImpl<_$SuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SessionModel? data, List<OrderModel> orders)
        success,
    required TResult Function(NetworkException exception) failure,
  }) {
    return success(data, orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult? Function(NetworkException exception)? failure,
  }) {
    return success?.call(data, orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult Function(NetworkException exception)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessState implements SessionState {
  const factory _SuccessState(
          final SessionModel? data, final List<OrderModel> orders) =
      _$SuccessStateImpl;

  SessionModel? get data;
  List<OrderModel> get orders;
  @JsonKey(ignore: true)
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureStateImplCopyWith<$Res> {
  factory _$$FailureStateImplCopyWith(
          _$FailureStateImpl value, $Res Function(_$FailureStateImpl) then) =
      __$$FailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkException exception});
}

/// @nodoc
class __$$FailureStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$FailureStateImpl>
    implements _$$FailureStateImplCopyWith<$Res> {
  __$$FailureStateImplCopyWithImpl(
      _$FailureStateImpl _value, $Res Function(_$FailureStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$FailureStateImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as NetworkException,
    ));
  }
}

/// @nodoc

class _$FailureStateImpl implements _FailureState {
  const _$FailureStateImpl(this.exception);

  @override
  final NetworkException exception;

  @override
  String toString() {
    return 'SessionState.failure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureStateImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureStateImplCopyWith<_$FailureStateImpl> get copyWith =>
      __$$FailureStateImplCopyWithImpl<_$FailureStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SessionModel? data, List<OrderModel> orders)
        success,
    required TResult Function(NetworkException exception) failure,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult? Function(NetworkException exception)? failure,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SessionModel? data, List<OrderModel> orders)? success,
    TResult Function(NetworkException exception)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _FailureState implements SessionState {
  const factory _FailureState(final NetworkException exception) =
      _$FailureStateImpl;

  NetworkException get exception;
  @JsonKey(ignore: true)
  _$$FailureStateImplCopyWith<_$FailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id) fetch,
    required TResult Function(String estabCode, String table) create,
    required TResult Function() closeSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id)? fetch,
    TResult? Function(String estabCode, String table)? create,
    TResult? Function()? closeSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id)? fetch,
    TResult Function(String estabCode, String table)? create,
    TResult Function()? closeSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEvent value) fetch,
    required TResult Function(_CreateEvent value) create,
    required TResult Function(_CloseSessionEvent value) closeSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEvent value)? fetch,
    TResult? Function(_CreateEvent value)? create,
    TResult? Function(_CloseSessionEvent value)? closeSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEvent value)? fetch,
    TResult Function(_CreateEvent value)? create,
    TResult Function(_CloseSessionEvent value)? closeSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res, SessionEvent>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res, $Val extends SessionEvent>
    implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchEventImplCopyWith<$Res> {
  factory _$$FetchEventImplCopyWith(
          _$FetchEventImpl value, $Res Function(_$FetchEventImpl) then) =
      __$$FetchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$FetchEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$FetchEventImpl>
    implements _$$FetchEventImplCopyWith<$Res> {
  __$$FetchEventImplCopyWithImpl(
      _$FetchEventImpl _value, $Res Function(_$FetchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$FetchEventImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FetchEventImpl implements FetchEvent {
  const _$FetchEventImpl({this.id});

  @override
  final int? id;

  @override
  String toString() {
    return 'SessionEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchEventImplCopyWith<_$FetchEventImpl> get copyWith =>
      __$$FetchEventImplCopyWithImpl<_$FetchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id) fetch,
    required TResult Function(String estabCode, String table) create,
    required TResult Function() closeSession,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id)? fetch,
    TResult? Function(String estabCode, String table)? create,
    TResult? Function()? closeSession,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id)? fetch,
    TResult Function(String estabCode, String table)? create,
    TResult Function()? closeSession,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEvent value) fetch,
    required TResult Function(_CreateEvent value) create,
    required TResult Function(_CloseSessionEvent value) closeSession,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEvent value)? fetch,
    TResult? Function(_CreateEvent value)? create,
    TResult? Function(_CloseSessionEvent value)? closeSession,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEvent value)? fetch,
    TResult Function(_CreateEvent value)? create,
    TResult Function(_CloseSessionEvent value)? closeSession,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchEvent implements SessionEvent {
  const factory FetchEvent({final int? id}) = _$FetchEventImpl;

  int? get id;
  @JsonKey(ignore: true)
  _$$FetchEventImplCopyWith<_$FetchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateEventImplCopyWith<$Res> {
  factory _$$CreateEventImplCopyWith(
          _$CreateEventImpl value, $Res Function(_$CreateEventImpl) then) =
      __$$CreateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String estabCode, String table});
}

/// @nodoc
class __$$CreateEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$CreateEventImpl>
    implements _$$CreateEventImplCopyWith<$Res> {
  __$$CreateEventImplCopyWithImpl(
      _$CreateEventImpl _value, $Res Function(_$CreateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estabCode = null,
    Object? table = null,
  }) {
    return _then(_$CreateEventImpl(
      null == estabCode
          ? _value.estabCode
          : estabCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateEventImpl implements _CreateEvent {
  const _$CreateEventImpl(this.estabCode, this.table);

  @override
  final String estabCode;
  @override
  final String table;

  @override
  String toString() {
    return 'SessionEvent.create(estabCode: $estabCode, table: $table)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventImpl &&
            (identical(other.estabCode, estabCode) ||
                other.estabCode == estabCode) &&
            (identical(other.table, table) || other.table == table));
  }

  @override
  int get hashCode => Object.hash(runtimeType, estabCode, table);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventImplCopyWith<_$CreateEventImpl> get copyWith =>
      __$$CreateEventImplCopyWithImpl<_$CreateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id) fetch,
    required TResult Function(String estabCode, String table) create,
    required TResult Function() closeSession,
  }) {
    return create(estabCode, table);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id)? fetch,
    TResult? Function(String estabCode, String table)? create,
    TResult? Function()? closeSession,
  }) {
    return create?.call(estabCode, table);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id)? fetch,
    TResult Function(String estabCode, String table)? create,
    TResult Function()? closeSession,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(estabCode, table);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEvent value) fetch,
    required TResult Function(_CreateEvent value) create,
    required TResult Function(_CloseSessionEvent value) closeSession,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEvent value)? fetch,
    TResult? Function(_CreateEvent value)? create,
    TResult? Function(_CloseSessionEvent value)? closeSession,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEvent value)? fetch,
    TResult Function(_CreateEvent value)? create,
    TResult Function(_CloseSessionEvent value)? closeSession,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _CreateEvent implements SessionEvent {
  const factory _CreateEvent(final String estabCode, final String table) =
      _$CreateEventImpl;

  String get estabCode;
  String get table;
  @JsonKey(ignore: true)
  _$$CreateEventImplCopyWith<_$CreateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseSessionEventImplCopyWith<$Res> {
  factory _$$CloseSessionEventImplCopyWith(_$CloseSessionEventImpl value,
          $Res Function(_$CloseSessionEventImpl) then) =
      __$$CloseSessionEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CloseSessionEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$CloseSessionEventImpl>
    implements _$$CloseSessionEventImplCopyWith<$Res> {
  __$$CloseSessionEventImplCopyWithImpl(_$CloseSessionEventImpl _value,
      $Res Function(_$CloseSessionEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CloseSessionEventImpl implements _CloseSessionEvent {
  const _$CloseSessionEventImpl();

  @override
  String toString() {
    return 'SessionEvent.closeSession()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CloseSessionEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id) fetch,
    required TResult Function(String estabCode, String table) create,
    required TResult Function() closeSession,
  }) {
    return closeSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id)? fetch,
    TResult? Function(String estabCode, String table)? create,
    TResult? Function()? closeSession,
  }) {
    return closeSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id)? fetch,
    TResult Function(String estabCode, String table)? create,
    TResult Function()? closeSession,
    required TResult orElse(),
  }) {
    if (closeSession != null) {
      return closeSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEvent value) fetch,
    required TResult Function(_CreateEvent value) create,
    required TResult Function(_CloseSessionEvent value) closeSession,
  }) {
    return closeSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEvent value)? fetch,
    TResult? Function(_CreateEvent value)? create,
    TResult? Function(_CloseSessionEvent value)? closeSession,
  }) {
    return closeSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEvent value)? fetch,
    TResult Function(_CreateEvent value)? create,
    TResult Function(_CloseSessionEvent value)? closeSession,
    required TResult orElse(),
  }) {
    if (closeSession != null) {
      return closeSession(this);
    }
    return orElse();
  }
}

abstract class _CloseSessionEvent implements SessionEvent {
  const factory _CloseSessionEvent() = _$CloseSessionEventImpl;
}
