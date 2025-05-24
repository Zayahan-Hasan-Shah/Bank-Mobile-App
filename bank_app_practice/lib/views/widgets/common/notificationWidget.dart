import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final VoidCallback onTap;
  const NotificationWidget({
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: Icon(Icons.notifications_none_rounded));
  }
}