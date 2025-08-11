import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:edital_client/edital_client.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../main.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  List<Notice> publishedNotices = [];
  List<Registration> userRegistrations = [];
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

      final [allNotices, registrations] = await Future.wait([
        client.notice.listNotices(),
        if (userId != null) client.registration.listRegistrationsByCandidate(userId)
        else Future.value(<Registration>[]),
      ]);

      setState(() {
        publishedNotices = (allNotices as List<Notice>)
            .where((notice) => notice.status == 'published')
            .toList();
        userRegistrations = registrations as List<Registration>;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar dados: $e')),
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
        title: const Text('Dashboard - Candidato'),
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
              onRefresh: _loadData,
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
                                  child: Icon(Icons.person, size: 30),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bem-vindo, ${authProvider.currentUser?.name ?? 'Usuário'}!',
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                      Text(
                                        'Candidato',
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

                    // My registrations section
                    Text(
                      'Minhas Inscrições',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    if (userRegistrations.isEmpty)
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Você ainda não se inscreveu em nenhum edital'),
                        ),
                      )
                    else
                      ...userRegistrations.map((registration) {
                        final notice = publishedNotices.firstWhere(
                          (n) => n.id == registration.noticeId,
                          orElse: () => Notice(
                            title: 'Edital não encontrado',
                            description: '',
                            startDate: DateTime.now(),
                            endDate: DateTime.now(),
                            status: 'unknown',
                            createdById: 0,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                          ),
                        );
                        return Card(
                          child: ListTile(
                            title: Text(notice.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Status: ${registration.status}'),
                                Text('Inscrito em: ${_formatDate(registration.submissionDate)}'),
                                if (registration.evaluationDate != null)
                                  Text('Avaliado em: ${_formatDate(registration.evaluationDate!)}'),
                              ],
                            ),
                            trailing: Chip(
                              label: Text(registration.status),
                              backgroundColor: _getStatusColor(registration.status),
                            ),
                            onTap: () => context.go('/user/notice/${notice.id}'),
                          ),
                        );
                      }).toList(),

                    const SizedBox(height: 24),

                    // Available notices section
                    Text(
                      'Editais Disponíveis',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    if (publishedNotices.isEmpty)
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Nenhum edital publicado no momento'),
                        ),
                      )
                    else
                      ...publishedNotices.map((notice) {
                        final isRegistered = userRegistrations
                            .any((reg) => reg.noticeId == notice.id);
                        final isExpired = notice.endDate.isBefore(DateTime.now());

                        return Card(
                          child: ListTile(
                            title: Text(notice.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(notice.description),
                                const SizedBox(height: 4),
                                Text('Início: ${_formatDate(notice.startDate)}'),
                                Text('Fim: ${_formatDate(notice.endDate)}'),
                                if (isExpired)
                                  const Text(
                                    'Prazo expirado',
                                    style: TextStyle(color: Colors.red),
                                  ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isRegistered)
                                  const Chip(
                                    label: Text('Inscrito'),
                                    backgroundColor: Colors.green,
                                  )
                                else if (isExpired)
                                  const Chip(
                                    label: Text('Expirado'),
                                    backgroundColor: Colors.grey,
                                  )
                                else
                                  ElevatedButton(
                                    onPressed: () => context.go('/user/register/${notice.id}'),
                                    child: const Text('Inscrever-se'),
                                  ),
                              ],
                            ),
                            onTap: () => context.go('/user/notice/${notice.id}'),
                          ),
                        );
                      }).toList(),
                  ],
                ),
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