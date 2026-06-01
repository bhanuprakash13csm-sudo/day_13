import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/form_screen.dart';
import '../screens/profile_screen.dart';

// TODO: Import more screens as you create them

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ─── Drawer Header ───────────────────────────────────────────
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white30,
                  child: Icon(Icons.widgets, color: Colors.white, size: 30),
                ),
                const SizedBox(height: 10),
                // TODO: Change the app name here
                const Text(
                  'Multi-Screen App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // TODO: Change the subtitle text here
                Text(
                  'Day 10 – UI Components & Navigation',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // ─── Navigation Items ─────────────────────────────────────────
          // TODO: Add or remove ListTile items as you add more screens

          ListTile(
            leading: const Icon(Icons.home_outlined, color: Color(0xFF6C63FF)),
            title: const Text('Home'),
            onTap: () {
              // TODO: Use Navigator.pushReplacement() so the back button doesn't loop
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info_outline, color: Color(0xFF6C63FF)),
            title: const Text('Detail Screen'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DetailScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.edit_note, color: Color(0xFF00BFA5)),
            title: const Text('Form Screen'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FormScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.person_outline, color: Color(0xFFFF7043)),
            title: const Text('Profile Screen'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),

          // ─── Divider ──────────────────────────────────────────────────
          const Divider(),

          // TODO: You can add extra actions here (e.g., Settings, Logout)
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.grey),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: 'Multi-Screen App',
                applicationVersion: '1.0.0',
                applicationLegalese: 'Day 10 Flutter Practical',
              );
            },
          ),
        ],
      ),
    );
  }
}
