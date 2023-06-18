import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService {
  NetworkService();

  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now,
        description: 'Read emails from mailbox',
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: now,
        description: 'Check latest news on Flutter',
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: now,
        description: 'Have a call with Flutter team',
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: now,
        description: 'Work on application performance',
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now,
        description: 'Plan work for next week',
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now,
        description: 'Order lunch',
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description: 'Create an invoice for last month',
      ),
    ];
  }
}
