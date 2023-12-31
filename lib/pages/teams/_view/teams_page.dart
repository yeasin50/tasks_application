import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../common/layout_wrapper.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayoutWrapper(
      childBuilder: (constraints) {
        return [
          Expanded(
            child: Align(
              // TODO: labels should be in app localization file
              child: Text('Teams'.tr().toString()),
            ),
          ),
        ];
      },
    );
  }
}
