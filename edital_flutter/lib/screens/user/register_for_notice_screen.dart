import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:edital_client/edital_client.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/loading_button.dart';
import '../../main.dart';

class RegisterForNoticeScreen extends StatefulWidget {
  final int noticeId;

  const RegisterForNoticeScreen({super.key, required this.noticeId});

  @override
  State<RegisterForNoticeScreen> createState() => _RegisterForNoticeScreenState();
}

class _RegisterForNoticeScreenState extends State<RegisterForNoticeScreen> {
  Notice? notice;
  bool _isLoading = false;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadNotice();
  }

  Future<void> _loadNotice() async {
    setState(() => _isLoading = true);
    try {
      final loadedNotice = await client.notice.getNoticeById(widget.noticeId);
      setState(() => notice = loadedNotice);
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

  Future<void> _submitRegistration() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userId = authProvider.currentUser?.id;

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro: usuário não encontrado')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final registration = Registration(
        noticeId: widget.noticeId,
        candidateId: userId,
        status: 'pending',
        submissionDate: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await client.registration.createRegistration(registration);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Inscrição realizada com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        context.go('/user/notice/${widget.noticeId}');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao realizar inscrição: $e')),
        );
      }
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscrever-se no Edital'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/user/notice/${widget.noticeId}'),
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
                                'Confirmação de Inscrição',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Edital: ${notice!.title}',
                                style: Theme.of(context).textTheme.titleLarge,
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
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Consumer<AuthProvider>(
                        builder: (context, authProvider, child) {
                          final user = authProvider.currentUser;
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Seus Dados',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  Text('Nome: ${user?.name ?? ''}'),
                                  Text('Email: ${user?.email ?? ''}'),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Confirme se seus dados estão corretos antes de prosseguir.',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      Card(
                        color: Colors.blue[50],
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.info, color: Colors.blue[700]),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Informações Importantes',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '• Após confirmar a inscrição, você receberá um email de confirmação.\n'
                                '• Sua inscrição ficará com status "Pendente" até ser avaliada pela comissão.\n'
                                '• Você pode acompanhar o status da sua inscrição no seu dashboard.\n'
                                '• Certifique-se de que seus dados estão corretos antes de confirmar.',
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      if (notice!.endDate.isBefore(DateTime.now()))
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            border: Border.all(color: Colors.red[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.error, color: Colors.red[700]),
                              const SizedBox(height: 8),
                              Text(
                                'Prazo de Inscrição Expirado',
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'O prazo para inscrições neste edital já expirou.',
                                style: TextStyle(color: Colors.red[700]),
                              ),
                            ],
                          ),
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LoadingButton(
                              onPressed: _submitRegistration,
                              isLoading: _isSubmitting,
                              text: 'Confirmar Inscrição',
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () => context.go('/user/notice/${widget.noticeId}'),
                              child: const Text('Cancelar'),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}