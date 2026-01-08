import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/notification_provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NotificationProvider>(context, listen: false).fetchNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (provider.notifications.isEmpty) {
            return const Center(child: Text('No notifications yet'));
          }

          return ListView.builder(
            itemCount: provider.notifications.length,
            itemBuilder: (context, index) {
              final item = provider.notifications[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Icon(_getIcon(item['type'] ?? ''), color: Theme.of(context).primaryColor),
                ),
                title: Text(item['title'] ?? 'Notification', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item['body'] ?? ''),
                trailing: item['read'] == false ? const CircleAvatar(radius: 4, backgroundColor: Colors.red) : null,
                onTap: () {
                  provider.markAsRead(item['_id']);
                },
              );
            },
          );
        },
      ),
    );
  }

  IconData _getIcon(String type) {
    switch (type) {
      case 'reminder': return Icons.alarm;
      case 'alert': return Icons.warning_amber_rounded;
      case 'completion': return Icons.check_circle_outline;
      default: return Icons.notifications;
    }
  }
}
