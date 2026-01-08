import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/task_provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/stopwatch_provider.dart';
import '../../widgets/task_item.dart';
import 'add_task_modal.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskProvider>(context, listen: false).fetchTasks();
    });
  }

  void _showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTaskModal(
        onSave: (title, time) {
          Provider.of<TaskProvider>(context, listen: false).addTask(title, time);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('NexTask'),
        automaticallyImplyLeading: false,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) => IconButton(
              icon: Icon(themeProvider.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => themeProvider.toggleTheme(themeProvider.themeMode != ThemeMode.dark),
            ),
          ),
        ],
      ),
      body: Consumer2<TaskProvider, StopwatchProvider>(
        builder: (context, taskProvider, stopwatch, child) {
          if (taskProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final filteredTasks = taskProvider.tasks.where((t) => t.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
          final ongoingTasks = filteredTasks.where((t) => t.status == 'ongoing').toList();
          final pendingTasks = filteredTasks.where((t) => t.status == 'pending' && !t.isCompleted).toList();
          final completedTasks = filteredTasks.where((t) => t.isCompleted).toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (val) => setState(() => _searchQuery = val),
                    decoration: InputDecoration(
                      hintText: 'Search tasks...',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Theme.of(context).cardColor,
                    ),
                  ),
                ),
              ),
              // Mini Stopwatch Card
              SliverToBoxAdapter(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: AppTheme.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Focus Timer', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            Text(stopwatch.formattedTime, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(stopwatch.isRunning ? Icons.pause : Icons.play_arrow, color: Colors.white),
                              onPressed: stopwatch.isRunning ? stopwatch.pause : stopwatch.start,
                            ),
                            IconButton(
                              icon: const Icon(Icons.stop, color: Colors.white),
                              onPressed: stopwatch.stop,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _buildSectionHeader('Ongoing Tasks', ongoingTasks.length),
              _buildTaskList(ongoingTasks, taskProvider),
              _buildSectionHeader('Pending Tasks', pendingTasks.length),
              _buildTaskList(pendingTasks, taskProvider),
              _buildSectionHeader('Ended Tasks', completedTasks.length),
              _buildTaskList(completedTasks, taskProvider),
              const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionHeader(String title, int count) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
            Text('$count', style: const TextStyle(color: AppTheme.secondaryColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList(List filteredTasks, TaskProvider taskProvider) {
    if (filteredTasks.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No tasks found in this section', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final task = filteredTasks[index];
          return TaskItem(
            task: task,
            onToggle: () => taskProvider.toggleTaskStatus(task.id),
            onDelete: () => taskProvider.removeTask(task.id),
            onStatusChange: (status) => taskProvider.setTaskStatus(task.id, status),
          );
        },
        childCount: filteredTasks.length,
      ),
    );
  }
}
