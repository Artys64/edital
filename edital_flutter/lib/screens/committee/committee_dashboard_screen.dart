import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:edital_client/edital_client.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../main.dart';

class CommitteeDashboardScreen extends StatefulWidget {
  const CommitteeDashboardScreen({super.key});

  @override
  State<CommitteeDashboardScreen> createState() => _CommitteeDashboardScreenState();
}

class _CommitteeDashboardScreenState extends State<CommitteeDashboardScreen> {
  List<Notice> assignedNotices = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadAssignedNotices();
  }

  Future<void> _loadAssignedNotices() async {
    setState(() => _isLoading = true);
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final userId = authProvider.currentUser?.id;

      if (userId != null) {
        // Get all notices first
        final allNotices = await client.notice.listNotices();
        
        // Filter notices where user is a committee member
        final assignedNoticeIds = <int>[];
        for (final notice in allNotices) {
          try {
            final committee = await client.evaluationCommittee
                .getCommitteeByNotice(notice.id!);
            if (committee.any((member) => member.evaluatorId == userId)) {
              assignedNoticeIds.add(notice.id!);
            }
          } catch (e) {
            // Notice might not have a committee yet
          }
        }

        setState(() {
          assignedNotices = allNotices
              .where((notice) => assignedNoticeIds.contains(notice.id))
              .toList();
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar editais: $e')),
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
        title: const Text('Dashboard - Comissão'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              context.go('/login');
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadAssignedNotices,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome card
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 30,
                                  child: Icon(Icons.gavel, size: 30),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bem-vindo, ${authProvider.currentUser?.name ?? 'Membro'}!',
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                      Text(
                                        'Membro da Comissão Avaliadora',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Statistics cards
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.blue[50],
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Icon(Icons.assignment, size: 32, color: Colors.blue[700]),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${assignedNotices.length}',
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                  Text(
                                    'Editais Atribuídos',
                                    style: TextStyle(color: Colors.blue[700]),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Card(
                            color: Colors.orange[50],
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Icon(Icons.pending_actions, size: 32, color: Colors.orange[700]),
                                  const SizedBox(height: 8),
                                  FutureBuilder<int>(
                                    future: _getPendingEvaluationsCount(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        '${snapshot.data ?? 0}',
                                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          color: Colors.orange[700],
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    'Avaliações Pendentes',
                                    style: TextStyle(color: Colors.orange[700]),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Assigned notices section
                    Text(
                      'Editais Atribuídos',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    if (assignedNotices.isEmpty)
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Você não está atribuído a nenhum edital no momento'),
                        ),
                      )
                    else
                      ...assignedNotices.map((notice) {
                        return Card(
                          child: ListTile(
                            title: Text(notice.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(notice.description),
                                const SizedBox(height: 4),
                                Text('Status: ${notice.status}'),
                                Text('Período: ${_formatDate(notice.startDate)} - ${_formatDate(notice.endDate)}'),
                              ],
                            ),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FutureBuilder<int>(
                                  future: _getNoticeRegistrationsCount(notice.id!),
                                  builder: (context, snapshot) {
                                    return Chip(
                                      label: Text('${snapshot.data ?? 0} inscrições'),
                                      backgroundColor: Colors.blue[100],
                                    );
                                  },
                                ),
                                const SizedBox(height: 4),
                                ElevatedButton(
                                  onPressed: () => context.go('/committee/evaluate/${notice.id}'),
                                  child: const Text('Avaliar'),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                  ],
                ),
              ),
            ),
    );
  }

  Future<int> _getPendingEvaluationsCount() async {
    int count = 0;
    for (final notice in assignedNotices) {
      try {
        final registrations = await client.registration
            .listRegistrationsByNotice(notice.id!);
        count += registrations.where((reg) => reg.status == 'pending').length;
      } catch (e) {
        // Ignore errors for individual notices
      }
    }
    return count;
  }

  Future<int> _getNoticeRegistrationsCount(int noticeId) async {
    try {
      final registrations = await client.registration
          .listRegistrationsByNotice(noticeId);
      return registrations.length;
    } catch (e) {
      return 0;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}