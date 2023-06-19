import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/task.dart';
import '../../../service/network_service.dart';

final taskProvider = FutureProvider<List<Task>>((ref) {
  final networkService = ref.watch(networkServiceProvider);

  return networkService.getTasks().then((value) => value);
});
