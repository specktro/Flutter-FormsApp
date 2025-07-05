import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Simple state provider'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Blocs'),
            subtitle: const Text('Simple state provider'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/bloc'),
          )
        ],
      )
    );
  }
}
