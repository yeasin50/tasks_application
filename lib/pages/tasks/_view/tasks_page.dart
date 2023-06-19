import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app_style.dart';
import '../../../common/layout_wrapper.dart';
import '../../../model/task.dart';
import '../providers/selected_task_prover.dart';
import '../widgets/task_details_widget.dart';
import '../widgets/tasks_list_widget.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    Key? key,
    this.selectedTaskID,
  }) : super(key: key);

  final String? selectedTaskID;
  @override
  Widget build(BuildContext context) {
    var title = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Tasks".tr(),
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
          if (selectedTaskID != null)
            Expanded(
              child: ColoredBox(
                color: AppStyle.canvasColor,
                child: Consumer(
                  builder: (context, ref, child) {
                    final task = ref.watch(
                      selectedTaskProvider(selectedTaskID),
                    );

                    if (task == null) {
                      return Center(
                        child: Text(
                          "Task not found", //todo: label should be in app localization file
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TaskDetails(task: task),
                            ),
                          ],
                        ),
                      );
                  },
                ),
              ),
            ),
        ];
      },
    );
  }
}
