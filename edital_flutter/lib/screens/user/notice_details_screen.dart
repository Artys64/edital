import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:edital_client/edital_client.dart';
import '../../providers/auth_provider.dart';
import '../../main.dart';

class NoticeDetailsScreen extends StatefulWidget {
  final int noticeId;

  const NoticeDetailsScreen({super.key, required this.noticeId});

  @override
  State<NoticeDetailsScreen> createState() => _NoticeDetailsScreenState();
}

class _NoticeDetailsScreenState extends State<NoticeDetailsScreen> {
  Notice? notice;
  Registration? userRegistration;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final userId = authProvider.currentUser?.id;

      final loadedNotice = await client.notice.getNoticeById(widget.noticeId);
      
      Registration? registration;
      if (userId != null) {
        try {
          final userRegistrations = await client.registration
              .listRegistrationsByCandidate(userId);
          registration = userRegistrations
              .where((reg) => reg.noticeId == widget.noticeId)
              .firstOrNull;
        } catch (e) {
          // User might not have any registrations
        }
      }

      setState(() {
        notice = loadedNotice;
        userRegistration = registration;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar edital: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Edital'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final authProvider = Provider.of<AuthProvider>(context, listen: false);
            if (authProvider.isUser) {
              context.go('/user');
            } else if (authProvider.isAdmin) {
              context.go('/admin');
            } else {
              context.go('/committee');
            }
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : notice == null
              ? const Center(child: Text('Edital não encontrado'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notice!.title,
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Descrição',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(notice!.description),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Data de Início',
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                        Text(_formatDate(notice!.startDate)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Data de Fim',
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                        Text(_formatDate(notice!.endDate)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    'Status: ',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Chip(
                                    label: Text(notice!.status),
                                    backgroundColor: notice!.status == 'published'
                                        ? Colors.green[100]
                                        : Colors.orange[100],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      if (userRegistration != null) ...[
                        const SizedBox(height: 16),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sua Inscrição',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text('Status: '),
                                    Chip(
                                      label: Text(userRegistration!.status),
                                      backgroundColor: _getStatusColor(userRegistration!.status),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Inscrito em: ${_formatDate(userRegistration!.submissionDate)}'),
                                if (userRegistration!.evaluationDate != null) ...[
                                  const SizedBox(height: 4),
                                  Text('Avaliado em: ${_formatDate(userRegistration!.evaluationDate!)}'),
                                ],
                                if (userRegistration!.evaluatorNotes != null) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    'Observações do Avaliador:',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(userRegistration!.evaluatorNotes!),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),
                      if (Provider.of<AuthProvider>(context, listen: false).isUser &&
                          notice!.status == 'published' &&
                          !notice!.endDate.isBefore(DateTime.now()))
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: userRegistration != null
                                ? null
                                : () => context.go('/user/register/${widget.noticeId}'),
                            child: Text(
                              userRegistration != null
                                  ? 'Já Inscrito'
                                  : 'Inscrever-se neste Edital',
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green[100]!;
      case 'rejected':
        return Colors.red[100]!;
      case 'pending':
        return Colors.orange[100]!;
      default:
        return Colors.grey[100]!;
    }
  }
}