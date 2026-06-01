import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'form_screen.dart';
import 'profile_screen.dart';
import '../widgets/left_drawer.dart';
import '../widgets/menu_card.dart';

// TODO: You can change these items to match your app's features
class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  const MenuItem({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // TODO: Add or remove items from this list
  final List<MenuItem> items = const [
    MenuItem(name: 'Detail Screen', icon: Icons.info_outline, color: Color(0xFF6C63FF)),
    MenuItem(name: 'Form Screen', icon: Icons.edit_note, color: Color(0xFF00BFA5)),
    MenuItem(name: 'Profile Screen', icon: Icons.person_outline, color: Color(0xFFFF7043)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Screen App'),
        // TODO: Customize the icon color if needed
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // TODO: Add the drawer to enable sidebar navigation
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF9C8FFF)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome! 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    // TODO: Change this to your app's tagline
                    'Explore the screens below to see Flutter navigation in action.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Screens',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            // Grid of menu cards
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return MenuCard(
                    item: item,
                    onTap: () {
                      // TODO: Use Navigator.push() to navigate to the correct screen
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text('You tapped: ${item.name}'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                      // Navigate to the appropriate screen based on the item name
                      if (item.name == 'Detail Screen') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailScreen(),
                          ),
                        );
                      } else if (item.name == 'Form Screen') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormScreen(),
                          ),
                        );
                      } else if (item.name == 'Profile Screen') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      }
                      // TODO: Add more navigation cases as you add more screens
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
