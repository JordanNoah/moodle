import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/view/views.dart';

final _sideNavigatiorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _sideNavigatiorKey,
  initialLocation: '/home', 
  routes: [
  GoRoute(
      path: '/side/conversation/:id',
      name: ConversationView.name,
      parentNavigatorKey: _sideNavigatiorKey,
      builder: (context, state) => ConversationView(
        id: state.pathParameters['id']!,
      )),
  GoRoute(
    path: '/side/course/:id',
    name: CourseView.name,
    parentNavigatorKey: _sideNavigatiorKey,
    builder: (context, state) => const CourseView(),
  ),
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppIndexView(
          childView: child,
        );
      },
      routes:[
        GoRoute(
          path: '/home',
          name: HomeView.name,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: '/messages',
          name: MessagesListView.name,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const MessagesListView(),
        ),
        GoRoute(
          path: '/notifications',
          name: NotificationListView.name,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const NotificationListView(),
        ),
        GoRoute(
          path: '/courses',
          name: CoursesListView.name,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const CoursesListView(),
        ),
        GoRoute(
          path: '/profile',
          name: ProfileView.name,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const ProfileView(),
        )
      ] 
    ),
  GoRoute(
    path: '/login',
    name: LoginView.name,
    parentNavigatorKey: _sideNavigatiorKey,
    builder: (context, state) => const LoginView(),
  )
]);
