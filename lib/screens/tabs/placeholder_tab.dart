import "package:flutter/material.dart";

// Temporary page for tabs that don't have real content yet.
class PlaceholderTab extends StatelessWidget {
  const PlaceholderTab({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Icon(icon, size: 96, color: Colors.grey),
      ),
    );
  }
}
