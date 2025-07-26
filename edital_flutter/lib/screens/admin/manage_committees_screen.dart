import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:edital_client/edital_client.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../main.dart';

class ManageCommitteesScreen extends StatefulWidget {
  const ManageCommitteesScreen({super.key});

  @override
  State<ManageCommitteesScreen> createState() => _ManageCommitteesScreenState();
}

class _ManageCommitteesScreenState extends State<ManageCommitteesScreen> {
  List<Notice> notices = [];
  List<User> committeeUsers = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final [loadedNotices, allUsers] = await Future.wait([
        client.notice.listNotices(),
        client.user.listUsers(),
      ]);
      
      setState(() {
        notices = loadedNotices as List<Notice>;
        committeeUsers = (allUsers as List<User>)
            .where((user) => user.role == 'committee' || user.role == 'admin')
            .toList();
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
        title: const Text('Gerenciar Comissões'),
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
                          child: ExpansionTile(
                            title: Text(notice.title),
                            subtitle: Text('Status: ${notice.status}'),
                            children: [
                              CommitteeManagementCard(
                                notice: notice,
                                availableUsers: committeeUsers,
                                onChanged: _loadData,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}

class CommitteeManagementCard extends StatefulWidget {
  final Notice notice;
  final List<User> availableUsers;
  final VoidCallback onChanged;

  const CommitteeManagementCard({
    super.key,
    required this.notice,
    required this.availableUsers,
    required this.onChanged,
  });

  @override
  State<CommitteeManagementCard> createState() => _CommitteeManagementCardState();
}

class _CommitteeManagementCardState extends State<CommitteeManagementCard> {
  List<EvaluationCommittee> committeeMembers = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCommitteeMembers();
  }

  Future<void> _loadCommitteeMembers() async {
    setState(() => _isLoading = true);
    try {
      final members = await client.evaluationCommittee
          .listCommitteeMembers(widget.notice.id!);
      setState(() => committeeMembers = members);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar membros da comissão: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _addMember(int userId, String role) async {
    try {
      await client.evaluationCommittee.addMember(
        widget.notice.id!,
        userId,
        role,
      );
      await _loadCommitteeMembers();
      widget.onChanged();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Membro adicionado com sucesso')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar membro: $e')),
        );
      }
    }
  }

  Future<void> _removeMember(int userId) async {
    try {
      await client.evaluationCommittee.removeMember(
        widget.notice.id!,
        userId,
      );
      await _loadCommitteeMembers();
      widget.onChanged();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Membro removido com sucesso')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao remover membro: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Comissão Avaliadora',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ElevatedButton.icon(
                onPressed: () => _showAddMemberDialog(),
                icon: const Icon(Icons.add),
                label: const Text('Adicionar Membro'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (committeeMembers.isEmpty)
            const Text('Nenhum membro na comissão')
          else
            ...committeeMembers.map((member) {
              final user = widget.availableUsers
                  .firstWhere((u) => u.id == member.evaluatorId);
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user.name.substring(0, 1).toUpperCase()),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Chip(
                        label: Text(member.role),
                        backgroundColor: member.role == 'coordinator'
                            ? Colors.blue[100]
                            : Colors.grey[200],
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmRemoveMember(user),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
        ],
      ),
    );
  }

  void _showAddMemberDialog() {
    // Get users not already in the committee
    final availableUsers = widget.availableUsers.where((user) {
      return !committeeMembers
          .any((member) => member.evaluatorId == user.id);
    }).toList();

    if (availableUsers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Todos os usuários disponíveis já estão na comissão'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AddMemberDialog(
        availableUsers: availableUsers,
        onAddMember: _addMember,
      ),
    );
  }

  Future<void> _confirmRemoveMember(User user) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Remoção'),
        content: Text('Tem certeza que deseja remover ${user.name} da comissão?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Remover'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _removeMember(user.id!);
    }
  }
}

class AddMemberDialog extends StatefulWidget {
  final List<User> availableUsers;
  final Function(int userId, String role) onAddMember;

  const AddMemberDialog({
    super.key,
    required this.availableUsers,
    required this.onAddMember,
  });

  @override
  State<AddMemberDialog> createState() => _AddMemberDialogState();
}

class _AddMemberDialogState extends State<AddMemberDialog> {
  User? _selectedUser;
  String _selectedRole = 'member';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Membro à Comissão'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<User>(
            value: _selectedUser,
            decoration: const InputDecoration(
              labelText: 'Selecionar Usuário',
              border: OutlineInputBorder(),
            ),
            items: widget.availableUsers.map((user) {
              return DropdownMenuItem(
                value: user,
                child: Text('${user.name} (${user.email})'),
              );
            }).toList(),
            onChanged: (user) {
              setState(() => _selectedUser = user);
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedRole,
            decoration: const InputDecoration(
              labelText: 'Função na Comissão',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'member', child: Text('Membro')),
              DropdownMenuItem(value: 'coordinator', child: Text('Coordenador')),
            ],
            onChanged: (role) {
              setState(() => _selectedRole = role!);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _selectedUser == null
              ? null
              : () {
                  widget.onAddMember(_selectedUser!.id!, _selectedRole);
                  Navigator.of(context).pop();
                },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}