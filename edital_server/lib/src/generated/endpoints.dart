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
import '../endpoints/evaluation_comittee.dart' as _i2;
import '../endpoints/notice_endpoint.dart' as _i3;
import '../endpoints/registration_endpoint.dart' as _i4;
import '../endpoints/user_endpoint.dart' as _i5;
import '../greeting_endpoint.dart' as _i6;
import 'package:edital_server/src/generated/evaluation_committee.dart' as _i7;
import 'package:edital_server/src/generated/notice.dart' as _i8;
import 'package:edital_server/src/generated/registration.dart' as _i9;
import 'package:edital_server/src/generated/user.dart' as _i10;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i11;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'evaluationCommittee': _i2.EvaluationCommitteeEndpoint()
        ..initialize(
          server,
          'evaluationCommittee',
          null,
        ),
      'notice': _i3.NoticeEndpoint()
        ..initialize(
          server,
          'notice',
          null,
        ),
      'registration': _i4.RegistrationEndpoint()
        ..initialize(
          server,
          'registration',
          null,
        ),
      'user': _i5.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'greeting': _i6.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['evaluationCommittee'] = _i1.EndpointConnector(
      name: 'evaluationCommittee',
      endpoint: endpoints['evaluationCommittee']!,
      methodConnectors: {
        'createCommittee': _i1.MethodConnector(
          name: 'createCommittee',
          params: {
            'committee': _i1.ParameterDescription(
              name: 'committee',
              type: _i1.getType<_i7.EvaluationCommittee>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i2.EvaluationCommitteeEndpoint)
                  .createCommittee(
            session,
            params['committee'],
          ),
        ),
        'getCommitteeByNotice': _i1.MethodConnector(
          name: 'getCommitteeByNotice',
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
              (endpoints['evaluationCommittee']
                      as _i2.EvaluationCommitteeEndpoint)
                  .getCommitteeByNotice(
            session,
            params['noticeId'],
          ),
        ),
        'listCommitteeMembers': _i1.MethodConnector(
          name: 'listCommitteeMembers',
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
              (endpoints['evaluationCommittee']
                      as _i2.EvaluationCommitteeEndpoint)
                  .listCommitteeMembers(
            session,
            params['noticeId'],
          ),
        ),
        'updateCommittee': _i1.MethodConnector(
          name: 'updateCommittee',
          params: {
            'committee': _i1.ParameterDescription(
              name: 'committee',
              type: _i1.getType<_i7.EvaluationCommittee>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i2.EvaluationCommitteeEndpoint)
                  .updateCommittee(
            session,
            params['committee'],
          ),
        ),
        'deleteCommittee': _i1.MethodConnector(
          name: 'deleteCommittee',
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
                      as _i2.EvaluationCommitteeEndpoint)
                  .deleteCommittee(
            session,
            params['id'],
          ),
        ),
        'addMember': _i1.MethodConnector(
          name: 'addMember',
          params: {
            'noticeId': _i1.ParameterDescription(
              name: 'noticeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'evaluatorId': _i1.ParameterDescription(
              name: 'evaluatorId',
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
                      as _i2.EvaluationCommitteeEndpoint)
                  .addMember(
            session,
            params['noticeId'],
            params['evaluatorId'],
            params['role'],
          ),
        ),
        'removeMember': _i1.MethodConnector(
          name: 'removeMember',
          params: {
            'noticeId': _i1.ParameterDescription(
              name: 'noticeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'evaluatorId': _i1.ParameterDescription(
              name: 'evaluatorId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee']
                      as _i2.EvaluationCommitteeEndpoint)
                  .removeMember(
            session,
            params['noticeId'],
            params['evaluatorId'],
          ),
        ),
      },
    );
    connectors['notice'] = _i1.EndpointConnector(
      name: 'notice',
      endpoint: endpoints['notice']!,
      methodConnectors: {
        'createNotice': _i1.MethodConnector(
          name: 'createNotice',
          params: {
            'notice': _i1.ParameterDescription(
              name: 'notice',
              type: _i1.getType<_i8.Notice>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notice'] as _i3.NoticeEndpoint).createNotice(
            session,
            params['notice'],
          ),
        ),
        'getNoticeById': _i1.MethodConnector(
          name: 'getNoticeById',
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
              (endpoints['notice'] as _i3.NoticeEndpoint).getNoticeById(
            session,
            params['id'],
          ),
        ),
        'listNotices': _i1.MethodConnector(
          name: 'listNotices',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notice'] as _i3.NoticeEndpoint).listNotices(session),
        ),
        'updateNotice': _i1.MethodConnector(
          name: 'updateNotice',
          params: {
            'notice': _i1.ParameterDescription(
              name: 'notice',
              type: _i1.getType<_i8.Notice>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notice'] as _i3.NoticeEndpoint).updateNotice(
            session,
            params['notice'],
          ),
        ),
        'deleteNotice': _i1.MethodConnector(
          name: 'deleteNotice',
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
              (endpoints['notice'] as _i3.NoticeEndpoint).deleteNotice(
            session,
            params['id'],
          ),
        ),
        'publishNotice': _i1.MethodConnector(
          name: 'publishNotice',
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
              (endpoints['notice'] as _i3.NoticeEndpoint).publishNotice(
            session,
            params['id'],
          ),
        ),
        'closeNotice': _i1.MethodConnector(
          name: 'closeNotice',
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
              (endpoints['notice'] as _i3.NoticeEndpoint).closeNotice(
            session,
            params['id'],
          ),
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
              type: _i1.getType<_i9.Registration>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
              type: _i1.getType<_i9.Registration>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
              (endpoints['registration'] as _i4.RegistrationEndpoint)
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
              (endpoints['registration'] as _i4.RegistrationEndpoint)
                  .evaluateRegistration(
            session,
            params['id'],
            params['status'],
            params['notes'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i10.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).createUser(
            session,
            params['user'],
          ),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
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
              (endpoints['user'] as _i5.UserEndpoint).getUserById(
            session,
            params['id'],
          ),
        ),
        'getUserByEmail': _i1.MethodConnector(
          name: 'getUserByEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).getUserByEmail(
            session,
            params['email'],
          ),
        ),
        'listUsers': _i1.MethodConnector(
          name: 'listUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).listUsers(session),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i10.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).updateUser(
            session,
            params['user'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
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
              (endpoints['user'] as _i5.UserEndpoint).deleteUser(
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
              (endpoints['greeting'] as _i6.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i11.Endpoints()..initializeEndpoints(server);
  }
}
