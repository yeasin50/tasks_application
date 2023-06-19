import 'package:flutter/material.dart';

import '../app_navigation_bar.dart';

//better name will responsive layout wrapper
/// A wrapper widget that provides a responsive layout for the app.
/// this include left navigation bar and the main content
class AppLayoutWrapper extends StatelessWidget {
  const AppLayoutWrapper({
    Key? key,
    required this.childBuilder,
  }) : super(key: key);

  final List<Widget> Function(BoxConstraints constraints) childBuilder; //can be typedef

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            return Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: width > 250 ? 250 : width, //todo: for smaller device use menu button
                  ),
                  child: AppNavigationBar(),
                ),
                ...childBuilder(constraints),
              ],
            );
          },
        ),
      ),
    );
  }
}
