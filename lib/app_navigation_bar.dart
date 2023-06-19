import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/app_style.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouter.of(context).location;

    final navigationBarItems = [
      // Done: labels should be in app localization file
      NavigationBarItem(
        name: 'Tasks',
        url: 'tasks',
      ),
      NavigationBarItem(
        name: 'Projects',
        url: 'projects',
      ),
      NavigationBarItem(
        name: 'Teams',
        url: 'teams',
      ),
    ];

    //Don't use ColoredBox,it doesn't provide transparency
    return Material(
      color: AppStyle.darkBlue,
      child: Column(
        children: [
          Expanded(
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
          ),
          LanguageSelector()
        ],
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
          item.name.tr(),
          style: TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}

///replace another place
class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    super.key,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final List<String> languages = ["English", "Arabic"];
  String? selectedLanguage;
  @override
  Widget build(BuildContext context) {
    selectedLanguage = context.locale.toString() == "en" ? "English" : "Arabic";
    return DropdownButton(
      value: selectedLanguage,
      items: languages //textButton looks better
          .map(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
      onChanged: (value) async {
        await context.setLocale(value == "English" ? Locale("en") : Locale("ar"));
        setState(() {
          selectedLanguage = value;
        });
      },
    );
  }
}
