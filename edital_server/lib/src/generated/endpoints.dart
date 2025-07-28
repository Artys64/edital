/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../auth_endpoint.dart' as _i2;
import '../endpoints/registration_endpoint.dart' as _i3;
import '../evaluation_committee_endpoint.dart' as _i4;
import '../greeting_endpoint.dart' as _i5;
import 'package:edital_server/src/generated/registration.dart' as _i6;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'registration': _i3.RegistrationEndpoint()
        ..initialize(
          server,
          'registration',
          null,
        ),
      'evaluationCommittee': _i4.EvaluationCommitteeEndpoint()
        ..initialize(
          server,
          'evaluationCommittee',
          null,
        ),
      'greeting': _i5.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).register(
            session,
            params['username'],
            params['password'],
            params['email'],
            params['role'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).login(
            session,
            params['username'],
            params['password'],
          ),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).getUserById(
            session,
            params['userId'],
          ),
        ),
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).getAllUsers(session),
        ),
      },
    );
    connectors['registration'] = _i1.EndpointConnector(
      name: 'registration',
      endpoint: endpoints['registration']!,
      methodConnectors: {
        'createRegistration': _i1.MethodConnector(
          name: 'createRegistration',
          params: {
            'registration': _i1.ParameterDescription(
              name: 'registration',
              type: _i1.getType<_i6.Registration>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .createRegistration(
            session,
            params['registration'],
          ),
        ),
        'getRegistrationById': _i1.MethodConnector(
          name: 'getRegistrationById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .getRegistrationById(
            session,
            params['id'],
          ),
        ),
        'listRegistrationsByNotice': _i1.MethodConnector(
          name: 'listRegistrationsByNotice',
          params: {
            'noticeId': _i1.ParameterDescription(
              name: 'noticeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .listRegistrationsByNotice(
            session,
            params['noticeId'],
          ),
        ),
        'listRegistrationsByCandidate': _i1.MethodConnector(
          name: 'listRegistrationsByCandidate',
          params: {
            'candidateId': _i1.ParameterDescription(
              name: 'candidateId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .listRegistrationsByCandidate(
            session,
            params['candidateId'],
          ),
        ),
        'updateRegistration': _i1.MethodConnector(
          name: 'updateRegistration',
          params: {
            'registration': _i1.ParameterDescription(
              name: 'registration',
              type: _i1.getType<_i6.Registration>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .updateRegistration(
            session,
            params['registration'],
          ),
        ),
        'deleteRegistration': _i1.MethodConnector(
          name: 'deleteRegistration',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .deleteRegistration(
            session,
            params['id'],
          ),
        ),
        'evaluateRegistration': _i1.MethodConnector(
          name: 'evaluateRegistration',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i3.RegistrationEndpoint)
                  .evaluateRegistration(
            session,
            params['id'],
            params['status'],
            params['notes'],
          ),
        ),
      },
    );
    connectors['evaluationCommittee'] = _i1.EndpointConnector(
      name: 'evaluationCommittee',
      endpoint: endpoints['evaluationCommittee']!,
      methodConnectors: {
        'getCommittees': _i1.MethodConnector(
          name: 'getCommittees',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i4.EvaluationCommitteeEndpoint)
                  .getCommittees(session),
        ),
        'createCommittee': _i1.MethodConnector(
          name: 'createCommittee',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i4.EvaluationCommitteeEndpoint)
                  .createCommittee(
            session,
            params['name'],
            params['description'],
          ),
        ),
        'listCommitteeMembers': _i1.MethodConnector(
          name: 'listCommitteeMembers',
          params: {
            'committeeId': _i1.ParameterDescription(
              name: 'committeeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i4.EvaluationCommitteeEndpoint)
                  .listCommitteeMembers(
            session,
            params['committeeId'],
          ),
        ),
        'addCommitteeMember': _i1.MethodConnector(
          name: 'addCommitteeMember',
          params: {
            'committeeId': _i1.ParameterDescription(
              name: 'committeeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i4.EvaluationCommitteeEndpoint)
                  .addCommitteeMember(
            session,
            params['committeeId'],
            params['userId'],
            params['role'],
          ),
        ),
        'removeCommitteeMember': _i1.MethodConnector(
          name: 'removeCommitteeMember',
          params: {
            'committeeId': _i1.ParameterDescription(
              name: 'committeeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i4.EvaluationCommitteeEndpoint)
                  .removeCommitteeMember(
            session,
            params['committeeId'],
            params['userId'],
          ),
        ),
        'getCommitteeById': _i1.MethodConnector(
          name: 'getCommitteeById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i4.EvaluationCommitteeEndpoint)
                  .getCommitteeById(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i5.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
