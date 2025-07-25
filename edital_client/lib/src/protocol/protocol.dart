/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'greeting.dart' as _i2;
import 'evaluation_committee.dart' as _i3;
import 'notice.dart' as _i4;
import 'registration.dart' as _i5;
import 'user.dart' as _i6;
import 'package:edital_client/src/protocol/evaluation_committee.dart' as _i7;
import 'package:edital_client/src/protocol/notice.dart' as _i8;
import 'package:edital_client/src/protocol/registration.dart' as _i9;
import 'package:edital_client/src/protocol/user.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
export 'greeting.dart';
export 'evaluation_committee.dart';
export 'notice.dart';
export 'registration.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.EvaluationCommittee) {
      return _i3.EvaluationCommittee.fromJson(data) as T;
    }
    if (t == _i4.Notice) {
      return _i4.Notice.fromJson(data) as T;
    }
    if (t == _i5.Registration) {
      return _i5.Registration.fromJson(data) as T;
    }
    if (t == _i6.User) {
      return _i6.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.EvaluationCommittee?>()) {
      return (data != null ? _i3.EvaluationCommittee.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.Notice?>()) {
      return (data != null ? _i4.Notice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Registration?>()) {
      return (data != null ? _i5.Registration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.User?>()) {
      return (data != null ? _i6.User.fromJson(data) : null) as T;
    }
    if (t == List<_i7.EvaluationCommittee>) {
      return (data as List)
          .map((e) => deserialize<_i7.EvaluationCommittee>(e))
          .toList() as T;
    }
    if (t == List<_i8.Notice>) {
      return (data as List).map((e) => deserialize<_i8.Notice>(e)).toList()
          as T;
    }
    if (t == List<_i9.Registration>) {
      return (data as List)
          .map((e) => deserialize<_i9.Registration>(e))
          .toList() as T;
    }
    if (t == List<_i10.User>) {
      return (data as List).map((e) => deserialize<_i10.User>(e)).toList() as T;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.EvaluationCommittee) {
      return 'EvaluationCommittee';
    }
    if (data is _i4.Notice) {
      return 'Notice';
    }
    if (data is _i5.Registration) {
      return 'Registration';
    }
    if (data is _i6.User) {
      return 'User';
    }
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'EvaluationCommittee') {
      return deserialize<_i3.EvaluationCommittee>(data['data']);
    }
    if (dataClassName == 'Notice') {
      return deserialize<_i4.Notice>(data['data']);
    }
    if (dataClassName == 'Registration') {
      return deserialize<_i5.Registration>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i6.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i11.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
