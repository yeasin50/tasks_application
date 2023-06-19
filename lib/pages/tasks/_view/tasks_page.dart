import 'package:flutter/material.dart';
import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/pages/tasks/widgets/task_details_widget.dart';
import 'package:task_list_app/pages/tasks/widgets/tasks_list_widget.dart';
import 'package:task_list_app/service/network_service.dart';

import '../../../common/layout_wrapper.dart';
import '../../../model/task.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Title", //todo: label should be in app localization file
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return AppLayoutWrapper(
      childBuilder: (constraints) {
        return [
          // middle section
          Expanded(
            child: ColoredBox(
              color: AppStyle.canvasColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    Divider(color: Colors.grey),
                    Expanded(child: TaskListWidget()),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          // right section
          Expanded(
            child: ColoredBox(
              color: AppStyle.canvasColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TaskDetails(
                  task: Task(
                    id: '1',
                    title: 'title',
                    dateTime: DateTime.now(),
                    description: 'description',
                  ),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
