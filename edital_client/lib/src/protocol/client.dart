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
import 'package:edital_client/src/protocol/registration.dart' as _i3;
import 'package:edital_client/src/auth_provider.dart' as _i4;
import 'package:edital_client/src/protocol/greeting.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// This endpoint handles authentication operations
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Register a new user
  _i2.Future<Map<String, dynamic>> register(
    String username,
    String password,
    String email,
    String role,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'register',
        {
          'username': username,
          'password': password,
          'email': email,
          'role': role,
        },
      );

  /// Login user
  _i2.Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'login',
        {
          'username': username,
          'password': password,
        },
      );

  /// Get user by ID
  _i2.Future<Map<String, dynamic>> getUserById(int userId) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'getUserById',
        {'userId': userId},
      );

  /// Get all users (admin only)
  _i2.Future<List<Map<String, dynamic>>> getAllUsers() =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'auth',
        'getAllUsers',
        {},
      );
}

/// {@category Endpoint}
class EndpointRegistration extends _i1.EndpointRef {
  EndpointRegistration(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registration';

  _i2.Future<_i3.Registration> createRegistration(
          _i3.Registration registration) =>
      caller.callServerEndpoint<_i3.Registration>(
        'registration',
        'createRegistration',
        {'registration': registration},
      );

  _i2.Future<_i3.Registration?> getRegistrationById(int id) =>
      caller.callServerEndpoint<_i3.Registration?>(
        'registration',
        'getRegistrationById',
        {'id': id},
      );

  _i2.Future<List<_i3.Registration>> listRegistrationsByNotice(int noticeId) =>
      caller.callServerEndpoint<List<_i3.Registration>>(
        'registration',
        'listRegistrationsByNotice',
        {'noticeId': noticeId},
      );

  _i2.Future<List<_i3.Registration>> listRegistrationsByCandidate(
          int candidateId) =>
      caller.callServerEndpoint<List<_i3.Registration>>(
        'registration',
        'listRegistrationsByCandidate',
        {'candidateId': candidateId},
      );

  _i2.Future<bool> updateRegistration(_i3.Registration registration) =>
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

/// This endpoint handles evaluation committee operations
/// {@category Endpoint}
class EndpointEvaluationCommittee extends _i1.EndpointRef {
  EndpointEvaluationCommittee(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'evaluationCommittee';

  /// Get all evaluation committees
  _i2.Future<List<_i4.EvaluationCommittee>> getCommittees() =>
      caller.callServerEndpoint<List<_i4.EvaluationCommittee>>(
        'evaluationCommittee',
        'getCommittees',
        {},
      );

  /// Create a new evaluation committee
  _i2.Future<_i4.EvaluationCommittee?> createCommittee(
    String name,
    String? description,
  ) =>
      caller.callServerEndpoint<_i4.EvaluationCommittee?>(
        'evaluationCommittee',
        'createCommittee',
        {
          'name': name,
          'description': description,
        },
      );

  /// List all members of a specific committee
  _i2.Future<List<Map<String, dynamic>>> listCommitteeMembers(
          int committeeId) =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'evaluationCommittee',
        'listCommitteeMembers',
        {'committeeId': committeeId},
      );

  /// Add a member to a committee
  _i2.Future<_i4.CommitteeMember?> addCommitteeMember(
    int committeeId,
    int userId,
    String role,
  ) =>
      caller.callServerEndpoint<_i4.CommitteeMember?>(
        'evaluationCommittee',
        'addCommitteeMember',
        {
          'committeeId': committeeId,
          'userId': userId,
          'role': role,
        },
      );

  /// Remove a member from a committee
  _i2.Future<bool> removeCommitteeMember(
    int committeeId,
    int userId,
  ) =>
      caller.callServerEndpoint<bool>(
        'evaluationCommittee',
        'removeCommitteeMember',
        {
          'committeeId': committeeId,
          'userId': userId,
        },
      );

  /// Get committee by ID
  _i2.Future<_i4.EvaluationCommittee?> getCommitteeById(int id) =>
      caller.callServerEndpoint<_i4.EvaluationCommittee?>(
        'evaluationCommittee',
        'getCommitteeById',
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
  _i2.Future<_i5.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i5.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
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
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    auth = EndpointAuth(this);
    registration = EndpointRegistration(this);
    evaluationCommittee = EndpointEvaluationCommittee(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAuth auth;

  late final EndpointRegistration registration;

  late final EndpointEvaluationCommittee evaluationCommittee;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'registration': registration,
        'evaluationCommittee': evaluationCommittee,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
