import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/task_model.dart';
import '../../core/theme/app_theme.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final Function(String)? onStatusChange;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
    this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: GestureDetector(
          onTap: onToggle,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: task.isCompleted ? AppTheme.accentColor : Colors.transparent,
              border: Border.all(
                color: AppTheme.accentColor,
                width: 2,
              ),
            ),
            child: task.isCompleted
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                task.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.primaryColor,
                      decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                      decorationColor: AppTheme.primaryColor,
                    ),
              ),
            ),
            if (!task.isCompleted)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: task.status == 'ongoing' ? Colors.orange.withOpacity(0.2) : Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  task.status.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: task.status == 'ongoing' ? Colors.orange : Colors.blue,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time_rounded, size: 14, color: AppTheme.secondaryColor),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('MMM d, h:mm a').format(task.scheduledTime),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.secondaryColor,
                        ),
                  ),
                ],
              ),
              if (!task.isCompleted && task.status == 'pending')
                TextButton(
                  onPressed: () {
                    if (onStatusChange != null) {
                      onStatusChange!('ongoing');
                    }
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 30)),
                  child: const Text('Start Work', style: TextStyle(fontSize: 12, color: AppTheme.primaryColor)),
                ),
            ],
          ),
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              color: AppTheme.secondaryColor,
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
