import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/common/app_style.dart';

/// create a ListTile widget to display a task on ListView
class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    var dateString = '';

    if (task.dateTime != null) {
      final DateFormat formatter = DateFormat('dd/MM, H:mm');
      dateString = formatter.format(task.dateTime!);
    }

    return Material(
      color: AppStyle.listTileColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {
          context.go('/tasks/${task.id}');
        },
        title: Text(task.title ?? ''),
        trailing: Text(dateString),
      ),
    );
  }
}
