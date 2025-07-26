import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:edital_client/edital_client.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/loading_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../main.dart';

class EvaluateRegistrationsScreen extends StatefulWidget {
  final int noticeId;

  const EvaluateRegistrationsScreen({super.key, required this.noticeId});

  @override
  State<EvaluateRegistrationsScreen> createState() => _EvaluateRegistrationsScreenState();
}

class _EvaluateRegistrationsScreenState extends State<EvaluateRegistrationsScreen> {
  Notice? notice;
  List<Registration> registrations = [];
  Map<int, User> users = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final [loadedNotice, loadedRegistrations, allUsers] = await Future.wait([
        client.notice.getNoticeById(widget.noticeId),
        client.registration.listRegistrationsByNotice(widget.noticeId),
        client.user.listUsers(),
      ]);

      final userMap = <int, User>{};
      for (final user in allUsers as List<User>) {
        if (user.id != null) {
          userMap[user.id!] = user;
        }
      }

      setState(() {
        notice = loadedNotice;
        registrations = loadedRegistrations as List<Registration>;
        users = userMap;
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

  Future<void> _evaluateRegistration(
    Registration registration,
    String status,
    String? notes,
  ) async {
    try {
      await client.registration.evaluateRegistration(
        registration.id!,
        status,
        notes,
      );
      await _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Avaliação salva com sucesso'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar avaliação: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliar Inscrições'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/committee'),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : notice == null
              ? const Center(child: Text('Edital não encontrado'))
              : Column(
                  children: [
                    // Header with notice info
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: Colors.blue[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notice!.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${registrations.length} inscrições • '
                            '${registrations.where((r) => r.status == 'pending').length} pendentes',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),

                    // Filter tabs
                    Container(
                      color: Colors.white,
                      child: DefaultTabController(
                        length: 4,
                        child: TabBar(
                          labelColor: Colors.blue[700],
                          unselectedLabelColor: Colors.grey[600],
                          indicatorColor: Colors.blue[700],
                          tabs: [
                            Tab(text: 'Todas (${registrations.length})'),
                            Tab(text: 'Pendentes (${registrations.where((r) => r.status == 'pending').length})'),
                            Tab(text: 'Aprovadas (${registrations.where((r) => r.status == 'approved').length})'),
                            Tab(text: 'Rejeitadas (${registrations.where((r) => r.status == 'rejected').length})'),
                          ],
                        ),
                      ),
                    ),

                    // Registrations list
                    Expanded(
                      child: DefaultTabController(
                        length: 4,
                        child: TabBarView(
                          children: [
                            _buildRegistrationsList(registrations),
                            _buildRegistrationsList(
                              registrations.where((r) => r.status == 'pending').toList(),
                            ),
                            _buildRegistrationsList(
                              registrations.where((r) => r.status == 'approved').toList(),
                            ),
                            _buildRegistrationsList(
                              registrations.where((r) => r.status == 'rejected').toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildRegistrationsList(List<Registration> filteredRegistrations) {
    if (filteredRegistrations.isEmpty) {
      return const Center(
        child: Text('Nenhuma inscrição encontrada'),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView.builder(
        itemCount: filteredRegistrations.length,
        itemBuilder: (context, index) {
          final registration = filteredRegistrations[index];
          final user = users[registration.candidateId];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(user?.name ?? 'Usuário não encontrado'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user?.email ?? ''),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('Status: '),
                      Chip(
                        label: Text(registration.status),
                        backgroundColor: _getStatusColor(registration.status),
                      ),
                    ],
                  ),
                ],
              ),
              children: [
                RegistrationEvaluationCard(
                  registration: registration,
                  user: user,
                  onEvaluate: _evaluateRegistration,
                ),
              ],
            ),
          );
        },
      ),
    );
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

class RegistrationEvaluationCard extends StatefulWidget {
  final Registration registration;
  final User? user;
  final Function(Registration, String, String?) onEvaluate;

  const RegistrationEvaluationCard({
    super.key,
    required this.registration,
    required this.user,
    required this.onEvaluate,
  });

  @override
  State<RegistrationEvaluationCard> createState() => _RegistrationEvaluationCardState();
}

class _RegistrationEvaluationCardState extends State<RegistrationEvaluationCard> {
  final _notesController = TextEditingController();
  String _selectedStatus = 'pending';
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.registration.status;
    _notesController.text = widget.registration.evaluatorNotes ?? '';
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submitEvaluation() async {
    setState(() => _isSubmitting = true);
    await widget.onEvaluate(
      widget.registration,
      _selectedStatus,
      _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
    );
    setState(() => _isSubmitting = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Candidate info
          Text(
            'Informações do Candidato',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(
                child: Text(
                  widget.user?.name?.substring(0, 1).toUpperCase() ?? 'U',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user?.name ?? 'Nome não disponível',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(widget.user?.email ?? 'Email não disponível'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Registration info
          Text(
            'Informações da Inscrição',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text('Data de Submissão: ${_formatDate(widget.registration.submissionDate)}'),
          if (widget.registration.evaluationDate != null)
            Text('Data de Avaliação: ${_formatDate(widget.registration.evaluationDate!)}'),
          const SizedBox(height: 16),

          // Evaluation section
          Text(
            'Avaliação',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: const InputDecoration(
                    labelText: 'Status da Avaliação',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'pending', child: Text('Pendente')),
                    DropdownMenuItem(value: 'approved', child: Text('Aprovado')),
                    DropdownMenuItem(value: 'rejected', child: Text('Rejeitado')),
                  ],
                  onChanged: (value) {
                    setState(() => _selectedStatus = value!);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _notesController,
            label: 'Observações (opcional)',
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: LoadingButton(
                  onPressed: _submitEvaluation,
                  isLoading: _isSubmitting,
                  text: 'Salvar Avaliação',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}