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
import 'dart:async' as _i2;
import 'package:edital_client/src/protocol/evaluation_committee.dart' as _i3;
import 'package:edital_client/src/protocol/notice.dart' as _i4;
import 'package:edital_client/src/protocol/registration.dart' as _i5;
import 'package:edital_client/src/protocol/user.dart' as _i6;
import 'package:edital_client/src/protocol/greeting.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
import 'protocol.dart' as _i9;

/// {@category Endpoint}
class EndpointEvaluationCommittee extends _i1.EndpointRef {
  EndpointEvaluationCommittee(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'evaluationCommittee';

  _i2.Future<_i3.EvaluationCommittee> createCommittee(
          _i3.EvaluationCommittee committee) =>
      caller.callServerEndpoint<_i3.EvaluationCommittee>(
        'evaluationCommittee',
        'createCommittee',
        {'committee': committee},
      );

  _i2.Future<List<_i3.EvaluationCommittee>> getCommitteeByNotice(
          int noticeId) =>
      caller.callServerEndpoint<List<_i3.EvaluationCommittee>>(
        'evaluationCommittee',
        'getCommitteeByNotice',
        {'noticeId': noticeId},
      );

  _i2.Future<List<_i3.EvaluationCommittee>> listCommitteeMembers(
          int noticeId) =>
      caller.callServerEndpoint<List<_i3.EvaluationCommittee>>(
        'evaluationCommittee',
        'listCommitteeMembers',
        {'noticeId': noticeId},
      );

  _i2.Future<bool> updateCommittee(_i3.EvaluationCommittee committee) =>
      caller.callServerEndpoint<bool>(
        'evaluationCommittee',
        'updateCommittee',
        {'committee': committee},
      );

  _i2.Future<bool> deleteCommittee(int id) => caller.callServerEndpoint<bool>(
        'evaluationCommittee',
        'deleteCommittee',
        {'id': id},
      );

  _i2.Future<_i3.EvaluationCommittee> addMember(
    int noticeId,
    int evaluatorId,
    String role,
  ) =>
      caller.callServerEndpoint<_i3.EvaluationCommittee>(
        'evaluationCommittee',
        'addMember',
        {
          'noticeId': noticeId,
          'evaluatorId': evaluatorId,
          'role': role,
        },
      );

  _i2.Future<bool> removeMember(
    int noticeId,
    int evaluatorId,
  ) =>
      caller.callServerEndpoint<bool>(
        'evaluationCommittee',
        'removeMember',
        {
          'noticeId': noticeId,
          'evaluatorId': evaluatorId,
        },
      );
}

/// {@category Endpoint}
class EndpointNotice extends _i1.EndpointRef {
  EndpointNotice(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notice';

  _i2.Future<_i4.Notice> createNotice(_i4.Notice notice) =>
      caller.callServerEndpoint<_i4.Notice>(
        'notice',
        'createNotice',
        {'notice': notice},
      );

  _i2.Future<_i4.Notice?> getNoticeById(int id) =>
      caller.callServerEndpoint<_i4.Notice?>(
        'notice',
        'getNoticeById',
        {'id': id},
      );

  _i2.Future<List<_i4.Notice>> listNotices() =>
      caller.callServerEndpoint<List<_i4.Notice>>(
        'notice',
        'listNotices',
        {},
      );

  _i2.Future<bool> updateNotice(_i4.Notice notice) =>
      caller.callServerEndpoint<bool>(
        'notice',
        'updateNotice',
        {'notice': notice},
      );

  _i2.Future<bool> deleteNotice(int id) => caller.callServerEndpoint<bool>(
        'notice',
        'deleteNotice',
        {'id': id},
      );

  _i2.Future<bool> publishNotice(int id) => caller.callServerEndpoint<bool>(
        'notice',
        'publishNotice',
        {'id': id},
      );

  _i2.Future<bool> closeNotice(int id) => caller.callServerEndpoint<bool>(
        'notice',
        'closeNotice',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointRegistration extends _i1.EndpointRef {
  EndpointRegistration(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registration';

  _i2.Future<_i5.Registration> createRegistration(
          _i5.Registration registration) =>
      caller.callServerEndpoint<_i5.Registration>(
        'registration',
        'createRegistration',
        {'registration': registration},
      );

  _i2.Future<_i5.Registration?> getRegistrationById(int id) =>
      caller.callServerEndpoint<_i5.Registration?>(
        'registration',
        'getRegistrationById',
        {'id': id},
      );

  _i2.Future<List<_i5.Registration>> listRegistrationsByNotice(int noticeId) =>
      caller.callServerEndpoint<List<_i5.Registration>>(
        'registration',
        'listRegistrationsByNotice',
        {'noticeId': noticeId},
      );

  _i2.Future<List<_i5.Registration>> listRegistrationsByCandidate(
          int candidateId) =>
      caller.callServerEndpoint<List<_i5.Registration>>(
        'registration',
        'listRegistrationsByCandidate',
        {'candidateId': candidateId},
      );

  _i2.Future<bool> updateRegistration(_i5.Registration registration) =>
      caller.callServerEndpoint<bool>(
        'registration',
        'updateRegistration',
        {'registration': registration},
      );

  _i2.Future<bool> deleteRegistration(int id) =>
      caller.callServerEndpoint<bool>(
        'registration',
        'deleteRegistration',
        {'id': id},
      );

  _i2.Future<bool> evaluateRegistration(
    int id,
    String status,
    String? notes,
  ) =>
      caller.callServerEndpoint<bool>(
        'registration',
        'evaluateRegistration',
        {
          'id': id,
          'status': status,
          'notes': notes,
        },
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i6.User> createUser(_i6.User user) =>
      caller.callServerEndpoint<_i6.User>(
        'user',
        'createUser',
        {'user': user},
      );

  _i2.Future<_i6.User?> getUserById(int id) =>
      caller.callServerEndpoint<_i6.User?>(
        'user',
        'getUserById',
        {'id': id},
      );

  _i2.Future<_i6.User?> getUserByEmail(String email) =>
      caller.callServerEndpoint<_i6.User?>(
        'user',
        'getUserByEmail',
        {'email': email},
      );

  _i2.Future<List<_i6.User>> listUsers() =>
      caller.callServerEndpoint<List<_i6.User>>(
        'user',
        'listUsers',
        {},
      );

  _i2.Future<bool> updateUser(_i6.User user) => caller.callServerEndpoint<bool>(
        'user',
        'updateUser',
        {'user': user},
      );

  _i2.Future<bool> deleteUser(int id) => caller.callServerEndpoint<bool>(
        'user',
        'deleteUser',
        {'id': id},
      );
}

/// This is an example endpoint that returns a greeting message through its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i7.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i7.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    evaluationCommittee = EndpointEvaluationCommittee(this);
    notice = EndpointNotice(this);
    registration = EndpointRegistration(this);
    user = EndpointUser(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEvaluationCommittee evaluationCommittee;

  late final EndpointNotice notice;

  late final EndpointRegistration registration;

  late final EndpointUser user;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'evaluationCommittee': evaluationCommittee,
        'notice': notice,
        'registration': registration,
        'user': user,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
