import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/task.dart';
import 'tasks_provider.dart';

final selectedTaskProvider = StateProvider.family<Task?, String?>((ref, id) {
  final refTasks = ref.read(taskProvider);

  return refTasks.map(data: (data) {
    try {
      print('selectedTaskProvider: ${data.value.firstWhere((element) => element.id == id)}');
      return data.value.firstWhere((element) => element.id == id);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }, loading: (_) {
    return null;
  }, error: (_) {
    return null;
  });
});
