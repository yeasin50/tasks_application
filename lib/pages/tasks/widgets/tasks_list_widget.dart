import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/task_providers.dart';
import 'task_listtile.dart';

/// render a list of tasks on ListView from
class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return tasks.map(
      data: (data) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: data.value.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return TaskListTile(
              task: data.value[index],
            );
          },
        );
      },
      loading: (_) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (_) {
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
