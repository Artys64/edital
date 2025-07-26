import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final user = authProvider.currentUser;
        final userRole = authProvider.userRole;

        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(user?.name ?? 'Usuário'),
                accountEmail: Text(user?.email ?? ''),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    user?.name?.substring(0, 1).toUpperCase() ?? 'U',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              if (userRole == 'admin') ...[
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Dashboard'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/admin');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('Gerenciar Editais'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/admin/notices');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text('Gerenciar Comissões'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/admin/committees');
                  },
                ),
              ],
              if (userRole == 'committee') ...[
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Dashboard'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/committee');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Avaliar Inscrições'),
                  onTap: () {
                    Navigator.pop(context);
                    // Will navigate to committee evaluation screen
                  },
                ),
              ],
              if (userRole == 'user') ...[
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Dashboard'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/user');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Meus Editais'),
                  onTap: () {
                    Navigator.pop(context);
                    // Will show user's registrations
                  },
                ),
              ],
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: () {
                  Navigator.pop(context);
                  authProvider.logout();
                  context.go('/login');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}