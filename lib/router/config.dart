import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/view/views.dart';

List shellRoutes = [
  {
    'icon': const Icon(Icons.home_rounded),
    'label': 'Home',
    'path': '/home',
    'completepath':'/home',
    'name': HomeView.name,
    'view': const HomeView()
  },
  {
    'icon': const Icon(Icons.chat_rounded),
    'label': 'Messages',
    'path': '/messages',
    'completepath':'/messages',
    'name': MessagesListView.name,
    'view': const MessagesListView()
  },
  {
    'icon': const Icon(Icons.notifications),
    'label': 'Notifications',
    'path': '/notifications',
    'completepath':'/notifications',
    'name': NotificationListView.name,
    'view': const NotificationListView()
  },
  {
    'icon': const Icon(Icons.collections_bookmark_rounded),
    'label': 'Courses',
    'path': '/courses',
    'completepath':'/courses',
    'name': CoursesListView.name,
    'view': const CoursesListView()
  },
  {
    'icon': const Icon(Icons.person_rounded),
    'label': 'Profile',
    'path': '/profile',
    'completepath':'/profile',
    'name': ProfileView.name,
    'view': const ProfileView()
  },
];

getShellRoutes(GlobalKey<NavigatorState> shellNavigatorKey){
  List<RouteBase>  listShellRoutes = [];
  for (var element in shellRoutes) {
    listShellRoutes.add(
      GoRoute(
        path: element["path"],
        name: element["name"],
        parentNavigatorKey: shellNavigatorKey,
        builder: (context, state) => element["view"],
      )
    );
  }
  return listShellRoutes;
}