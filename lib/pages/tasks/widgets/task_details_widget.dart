import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/task.dart';

import '../../../common/app_style.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final dateString = DateFormat('dd/MM, H:mm').format(task.dateTime!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            task.title ?? '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(color: Colors.grey),
        SizedBox(height: 32),
        Text(
          dateString,
          style: TextStyle(
            color: AppStyle.dateColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 32),
        Expanded(
          child: SingleChildScrollView(child: Text(task.description ?? '')),
        ),
      ],
    );
  }
}
