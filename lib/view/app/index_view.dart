import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/components/app_bar_navigation.dart';
import 'package:moodle/components/bottom_navigation_bar.dart';
import 'package:moodle/router/config.dart';
import 'package:moodle/view/app/messages_list_view.dart';

class AppIndexView extends StatelessWidget {
  static const String name = 'app_index_view';
  final Widget childView;
  const AppIndexView({super.key, required this.childView});

  getTitlePage(context) {
    return shellRoutes
        .where((element) =>
            element["completepath"] == GoRouterState.of(context).location)
        .first["label"];
  }

  getActions(context) {
    var nameLocation = GoRouterState.of(context).location;
    //print(MessagesListView.name);
    print(nameLocation);
    List<Widget> actions = [];
    if (nameLocation == '/messages') {
      actions.add(IconButton(onPressed: () => {
        print("contacts")
      }, icon: Icon(Icons.group_rounded)));
      actions.add(IconButton(
          onPressed: () => {print("new message")},
          icon: Icon(Icons.edit_square)));
    }
    return actions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(getTitlePage(context)),
        actions: getActions(context),
      ),
      body: childView,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
