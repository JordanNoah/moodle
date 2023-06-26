import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/view/app/views.dart';

List shellRoutes = [
  {
    'icon': const Icon(Icons.home_rounded),
    'label': 'Home',
    'path':'/home',
    'name': HomeView.name,
    'view': HomeView()
  },
  {
    'icon': const Icon(Icons.chat_rounded),
    'label': 'Messages',
    'path':'/messages',
    'name': MessagesListView.name,
    'view': MessagesListView()
  },
  {
    'icon': const Icon(Icons.notifications),
    'label': 'Notifications',
    'path':'/notifications',
    'name': NotificationListView.name,
    'view': NotificationListView()
  },
  {
    'icon': const Icon(Icons.collections_bookmark_rounded),
    'label': 'Courses',
    'path':'/courses',
    'name': CoursesListView.name,
    'view': CoursesListView()
  },
  {
    'icon': const Icon(Icons.person_rounded),
    'label': 'Profile',
    'path':'/profile',
    'name': ProfileView.name,
    'view': ProfileView()
  },
];

getShellRoutes(){
  List<RouteBase>  listShellRoutes = [];
  for (var element in shellRoutes) {
    listShellRoutes.add(
      GoRoute(
        path: element["path"],
        name: element["name"],
        builder: (context, state) => element["view"],
      )
    );
  }
  return listShellRoutes;
}