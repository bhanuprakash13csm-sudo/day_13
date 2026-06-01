import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // TODO: Add the drawer here if you want the drawer on this screen too
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image / banner
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF4ECDC4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.widgets_outlined,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // TODO: Replace with actual content title
            const Text(
              'UI Components in Flutter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // TODO: Replace with actual content description
            const Text(
              'Flutter provides a rich set of pre-built widgets that you can use to compose beautiful UIs. '
              'This screen demonstrates how to display detailed content navigated from the home screen.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),

            // Info cards section
            const Text(
              'Key Concepts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // TODO: Replace these cards with your own content
            _buildInfoCard(
              icon: Icons.navigation,
              title: 'Navigator.push()',
              description: 'Adds a new route on top of the navigation stack.',
              color: const Color(0xFF6C63FF),
            ),
            const SizedBox(height: 10),
            _buildInfoCard(
              icon: Icons.arrow_back,
              title: 'Navigator.pop()',
              description: 'Removes the current route and returns to the previous one.',
              color: const Color(0xFF00BFA5),
            ),
            const SizedBox(height: 10),
            _buildInfoCard(
              icon: Icons.swap_horiz,
              title: 'Navigator.pushReplacement()',
              description: 'Replaces the current route with a new one.',
              color: const Color(0xFFFF7043),
            ),
            const SizedBox(height: 30),

            // Back button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Navigator.pop() goes back to the previous screen
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
