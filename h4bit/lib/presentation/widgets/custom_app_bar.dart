import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  CustomAppBar({required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        ...?actions,
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () async {
            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);
            await authProvider.signOut();
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
