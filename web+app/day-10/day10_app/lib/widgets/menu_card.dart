import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

// TODO: Import the MenuItem class — it is defined in home_screen.dart
// MenuCard is the reusable card widget used in the HomeScreen grid.

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: item.color.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: item.color.withValues(alpha: 0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon container
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.icon,
                color: item.color,
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            // Label
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: item.color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Tap to open',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
