import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:edital_client/edital_client.dart';
import '../../providers/auth_provider.dart';
import '../../providers/app_state_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/loading_button.dart';
import '../../main.dart';

class ManageNoticesScreen extends StatefulWidget {
  const ManageNoticesScreen({super.key});

  @override
  State<ManageNoticesScreen> createState() => _ManageNoticesScreenState();
}

class _ManageNoticesScreenState extends State<ManageNoticesScreen> {
  List<Notice> notices = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadNotices();
  }

  Future<void> _loadNotices() async {
    setState(() => _isLoading = true);
    try {
      final loadedNotices = await client.notice.listNotices();
      setState(() => notices = loadedNotices);
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

  Future<void> _deleteNotice(int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Exclusão'),
        content: const Text('Tem certeza que deseja excluir este edital?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await client.notice.deleteNotice(id);
        await _loadNotices();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Edital excluído com sucesso')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao excluir edital: $e')),
          );
        }
      }
    }
  }

  Future<void> _toggleNoticeStatus(Notice notice) async {
    try {
      if (notice.status == 'published') {
        await client.notice.closeNotice(notice.id!);
      } else {
        await client.notice.publishNotice(notice.id!);
      }
      await _loadNotices();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              notice.status == 'published'
                  ? 'Edital fechado com sucesso'
                  : 'Edital publicado com sucesso',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar status: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Editais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateNoticeDialog(),
          ),
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
              onRefresh: _loadNotices,
              child: notices.isEmpty
                  ? const Center(
                      child: Text('Nenhum edital encontrado'),
                    )
                  : ListView.builder(
                      itemCount: notices.length,
                      itemBuilder: (context, index) {
                        final notice = notices[index];
                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(notice.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(notice.description),
                                const SizedBox(height: 4),
                                Text(
                                  'Status: ${notice.status}',
                                  style: TextStyle(
                                    color: notice.status == 'published'
                                        ? Colors.green
                                        : Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Início: ${_formatDate(notice.startDate)}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Fim: ${_formatDate(notice.endDate)}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            trailing: PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: const Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(width: 8),
                                      Text('Editar'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'toggle',
                                  child: Row(
                                    children: [
                                      Icon(notice.status == 'published'
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                      const SizedBox(width: 8),
                                      Text(notice.status == 'published'
                                          ? 'Fechar'
                                          : 'Publicar'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: const Row(
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      SizedBox(width: 8),
                                      Text('Excluir', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                              ],
                              onSelected: (value) {
                                switch (value) {
                                  case 'edit':
                                    _showCreateNoticeDialog(notice: notice);
                                    break;
                                  case 'toggle':
                                    _toggleNoticeStatus(notice);
                                    break;
                                  case 'delete':
                                    _deleteNotice(notice.id!);
                                    break;
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _showCreateNoticeDialog({Notice? notice}) {
    showDialog(
      context: context,
      builder: (context) => CreateNoticeDialog(
        notice: notice,
        onSaved: _loadNotices,
      ),
    );
  }
}

class CreateNoticeDialog extends StatefulWidget {
  final Notice? notice;
  final VoidCallback onSaved;

  const CreateNoticeDialog({
    super.key,
    this.notice,
    required this.onSaved,
  });

  @override
  State<CreateNoticeDialog> createState() => _CreateNoticeDialogState();
}

class _CreateNoticeDialogState extends State<CreateNoticeDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.notice?.title ?? '');
    _descriptionController = TextEditingController(text: widget.notice?.description ?? '');
    _startDate = widget.notice?.startDate;
    _endDate = widget.notice?.endDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveNotice() async {
    if (!_formKey.currentState!.validate()) return;
    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione as datas')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final now = DateTime.now();

      if (widget.notice == null) {
        // Create new notice
        final notice = Notice(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          startDate: _startDate!,
          endDate: _endDate!,
          status: 'draft',
          createdById: authProvider.currentUser!.id!,
          createdAt: now,
          updatedAt: now,
        );
        await client.notice.createNotice(notice);
      } else {
        // Update existing notice
        final updatedNotice = widget.notice!.copyWith(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          startDate: _startDate,
          endDate: _endDate,
          updatedAt: now,
        );
        await client.notice.updateNotice(updatedNotice);
      }

      widget.onSaved();
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.notice == null
                  ? 'Edital criado com sucesso'
                  : 'Edital atualizado com sucesso',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar edital: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.notice == null ? 'Criar Edital' : 'Editar Edital'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: _titleController,
                label: 'Título',
                validator: (value) =>
                    value?.isEmpty == true ? 'Título é obrigatório' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _descriptionController,
                label: 'Descrição',
                validator: (value) =>
                    value?.isEmpty == true ? 'Descrição é obrigatória' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _startDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          setState(() => _startDate = date);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _startDate == null
                              ? 'Data de Início'
                              : 'Início: ${_formatDate(_startDate!)}',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _endDate ?? _startDate ?? DateTime.now(),
                          firstDate: _startDate ?? DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          setState(() => _endDate = date);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _endDate == null
                              ? 'Data de Fim'
                              : 'Fim: ${_formatDate(_endDate!)}',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        LoadingButton(
          onPressed: _saveNotice,
          isLoading: _isLoading,
          text: widget.notice == null ? 'Criar' : 'Salvar',
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}