import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/app_style.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouter.of(context).location;

    //Don't use ColoredBox,it doesn't provide transparency
    return Material(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) {
          final bool isSelected = currentPath.toLowerCase().contains(navigationBarItems[index].url.toLowerCase());
          return InkWell(
            onTap: () {
              if (currentPath == navigationBarItems[index].url) return;
              context.go("/${navigationBarItems[index].url}");
            },
            child: _NavigationBarListItem(
              isSelected: isSelected,
              item: navigationBarItems[index],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
    this.isSelected = false,
  }) : super(key: key);
  final NavigationBarItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppStyle.amber : null,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          item.name,
          style: TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

final navigationBarItems = [
  // TODO: labels should be in app localization file
  NavigationBarItem(name: 'Tasks', url: 'tasks'),
  NavigationBarItem(name: 'Projects', url: 'projects'),
  NavigationBarItem(name: 'Teams', url: 'teams'),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
