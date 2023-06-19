import 'package:flutter/material.dart';

import '../../../common/layout_wrapper.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayoutWrapper(
      childBuilder: (constraints) {
        return [
          Expanded(
            child: Align(
              child: Text('Projects'),
            ),
          ),
        ];
      },
    );
  }
}
