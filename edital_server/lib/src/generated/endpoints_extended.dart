/* MANUALLY CREATED - TEMPORARY SOLUTION UNTIL SERVERPOD GENERATE WORKS */
/*   To regenerate properly run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../greeting_endpoint.dart' as _i2;
import '../notice_endpoint.dart' as _i3;
import '../auth_endpoint.dart' as _i4;
import '../evaluation_committee_endpoint.dart' as _i5;

class EndpointsExtended extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'greeting': _i2.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'notice': _i3.NoticeEndpoint()
        ..initialize(
          server,
          'notice',
          null,
        ),
      'auth': _i4.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'evaluationCommittee': _i5.EvaluationCommitteeEndpoint()
        ..initialize(
          server,
          'evaluationCommittee',
          null,
        )
    };
    
    // Original endpoints
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
              (endpoints['greeting'] as _i2.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    
    connectors['notice'] = _i1.EndpointConnector(
      name: 'notice',
      endpoint: endpoints['notice']!,
      methodConnectors: {
        'getNotices': _i1.MethodConnector(
          name: 'getNotices',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notice'] as _i3.NoticeEndpoint).getNotices(session),
        ),
        'createNotice': _i1.MethodConnector(
          name: 'createNotice',
          params: {
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notice'] as _i3.NoticeEndpoint).createNotice(
            session,
            params['title'],
            params['content'],
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
        )
      },
    );

    // Auth endpoints
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i4.AuthEndpoint).register(
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i4.AuthEndpoint).login(
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
              (endpoints['auth'] as _i4.AuthEndpoint).getUserById(
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
              (endpoints['auth'] as _i4.AuthEndpoint).getAllUsers(session),
        )
      },
    );

    // Evaluation Committee endpoints
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
              (endpoints['evaluationCommittee'] as _i5.EvaluationCommitteeEndpoint).getCommittees(session),
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee'] as _i5.EvaluationCommitteeEndpoint).createCommittee(
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
              (endpoints['evaluationCommittee'] as _i5.EvaluationCommitteeEndpoint).listCommitteeMembers(
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee'] as _i5.EvaluationCommitteeEndpoint).addCommitteeMember(
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evaluationCommittee'] as _i5.EvaluationCommitteeEndpoint).removeCommitteeMember(
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
              (endpoints['evaluationCommittee'] as _i5.EvaluationCommitteeEndpoint).getCommitteeById(
            session,
            params['id'],
          ),
        )
      },
    );
  }
}